---
layout: post
title:  "Distributed Array of Commodity Hosting Services (DACHS)"
date:   2016-10-02 15:29:37
categories: definition architecture web commodity
---

<span><q>not [suitable for] enterprise production use where an
enterprise such as ourselves would want an SLA.</q> -- anonymous Architect</span>
{: class="look-at-me"}

The above quote shocked me when I was describing to some people how a particular
solution worked. The ideas that it contains don't seem to be as well-known
as I thought. This post is an attempt to do something about that.

This approach for running internet services is a logical step from the
[Google research paper "The Datacenter as a computer"][paper]. I'm not sure it has a
name, or is documented anywhere else. It's an approach I've used to reduce hosting
costs by a factor of 1,000 for a recent project.

> Our central point is that the datacenters powering many of today’s successful Internet services
are no longer simply a miscellaneous collection of machines co-located in a facility and wired up
together. The software running on these systems, such as Gmail or Web search services, execute
at a scale far beyond a single machine or a single rack: they run on no smaller a unit than clusters
of hundreds to thousands of individual servers. Therefore, the machine, the computer, is this large
cluster or aggregation of servers itself and needs to be considered as a single computing unit.

Rather than treating a datacenter as a computer, we can treat any component at
any level as a composable abstraction.

It came about after discussions with [Jonathan][jcm] and [Adam][adam]. We wanted
to package commodity services. By doing so, we thought we could [make something
greater than the sum of the parts](#fn:1)[^1]. It seemed to provide a better
level of service than any of them would offer in isolation. And so we conceived
of DACHS[^2].

## Starting point

We have some Platform as a Service (PaaS) that we want to run our application
on. We need to run 100 instances of our application to handle the expected
load. We'll call this zone A.

The zone A PaaS offers a Service Level Agreement (SLA) of 95% availability[^3].

<table>
<tr>
<th>PaaS cost (%)</th>
<th>Availability (%)</th>
</tr>
<tr>
<td>100</td>
<td>95%</td>
</tr>
</table>

How can we improve on that?

## Add a thing in front of it

Remember the [fundamental theorem of software engineering][ftse]:

> We can solve any problem by adding a layer of indirection

First we put in another layer in front of our PaaS. This layer offers an SLA of
99.99% availability. This layer routes traffic to our stateless application
running in the PaaS.

<table>
<tr>
<th>PaaS cost (%)</th>
<th>Availability (%)</th>
</tr>
<tr>
<td>100</td>
<td>94.99</td>
</tr>
</table>

This has actually made things worse. The [serial availability equation](#fn:1) tells us
how to calculate availability for this case.

![Availability of Serial Components](/images/dachs/serial.svg "Availability of Serial Components")

It's the product of all the component's availability in the network path. So
that would be `0.9999 * 0.95 = 94.9905%` availability.

We're also now paying for another thing -- the routing layer.

## Cope with single zone failure

We next add a similar PaaS, with similar SLAs. We deploy our app into that, and
update our routing layer to send traffic to this new zone B as well. The
benefits of making this change include we:

- can cope with an outage happening in either zone; the other zone will just soak up
the traffic
- have increased our availability

We can now use the [parallel availability equation](#fn:1).

![Availability of Parallel Components](/images/dachs/parallel.svg "Availability of Parallel Components")

The combined availability of zones A and B is `1 - [(1 - 0.95) * (1 - 0.95)] = 0.9975`.

But we still have the routing layer at 99.99%. We need to combine those numbers
using the the serial availability equation again. That gives us
`0.9999 * 0.9975 = 99.740025%`. By running 2 zones in parallel, we get a big
boost above the basic 95% SLA that either PaaS provider used individually
would offer.

It might be that both zones have an outage at the same time, as part of their
95% SLA. We can make choices around which provider to use to try to avoid that.

For example, Azure, AWS, and Google are unlikely to all have problems at the
same time. If they do, something really bad has happened.

Unfortunately, we've doubled our costs in a naive implementation. We're now
paying for 100 instances in both zones.

<table>
<tr>
<th>PaaS cost (%)</th>
<th>Availability (%)</th>
</tr>
<tr>
<td>200</td>
<td>99.74%</td>
</tr>
</table>

Elastic scaling could help with that cost aspect. There are risks that if other
people have architected things in this way. Everyone could end up trying to
autoscale in the same zone! You should talk to a relevant stakeholder about how
much they care whether you solve that problem.

## Cope with multiple zone failures

We decide to add some more PaaS providers. We now have zones C, D, and E, and we
get to make other decisions.

![Availability of multiple parallel components](/images/dachs/multiple-zones.svg "Availability of multiple parallel components")

How many zone failures do we need to be resilient against? If the answer is just
1, then we only need to put 25 instances of our application in each zone,
and we're good. We'd be paying for `5 * 25 = 125` instances of the application
running across the 5 zones. We'd still have 100 available to serve customers
if a single zone failed.

<table>
<tr>
<th>PaaS cost (%)</th>
<th>Availability (%)</th>
</tr>
<tr>
<td>125</td>
<td>99.99%</td>
</tr>
</table>

We get to make choices for operational complexity and cost about what degree of
resilience we want. Handling 2 zones being down might be an acceptable outcome
in your context. In that case, we'd have:

- 34 instances running in each zone
- 102 instances still serving customers if 2 zones failed at the same time

<table>
<tr>
<th>PaaS cost (%)</th>
<th>Availability (%)</th>
</tr>
<tr>
<td>170</td>
<td>99.99%</td>
</tr>
</table>

## Profit!

So I hope this shows that by packaging commodity components together, you can
achieve the SLAs otherwise obtained by driving large trucks of money to large
companies.

I also made [a short video which demonstrates this approach][youtube].

### Notes

[^1]: There's a theoretical basis for this as well. [The parallel and serial availability equations](https://books.google.co.uk/books?id=wUyDF1yWfhMC&lpg=PA28&ots=iFJ0ivnIF7&dq=availability%20in%20parallel&pg=PA23#v=onepage&q=availability%20in%20parallel&f=false) are well-known within the electronics and network engineering communities.
[^2]: The name is completely Jonathan's fault. He's a (cat and) dachshund person.
[^3]: Some don't seem to offer any at all. If you read
      [Pivotal Web Services terms][terms],we see:

      > 11.1 Limitation of Liability. TO THE MAXIMUM EXTENT MANDATED BY LAW, IN NO EVENT WILL WE OR OUR LICENSORS BE LIABLE FOR ANY LOST PROFITS OR BUSINESS OPPORTUNITIES, LOSS OF USE OF THE SERVICE OFFERINGS, LOSS OF REVENUE, LOSS OF GOODWILL, BUSINESS INTERRUPTION, LOSS OF DATA; OR ANY INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, UNDER ANY THEORY OF LIABILITY, AND WHETHER BASED IN CONTRACT, TORT, NEGLIGENCE, PRODUCT LIABILITY, OR OTHERWISE. IN ADDITION, OUR AND OUR LICENSORS’ LIABILITY UNDER THIS AGREEMENT WILL NOT, IN ANY EVENT, REGARDLESS OF WHETHER THE CLAIM IS BASED IN CONTRACT, TORT, STRICT LIABILITY, OR OTHERWISE, EXCEED THE AGGREGATE FEES YOU PAID TO US FOR THE SERVICE OFFERINGS IN THE TWELVE (12) MONTHS PRIOR TO THE EVENT GIVING RISE TO YOUR CLAIM REGARDLESS OF WHETHER WE OR OUR LICENSORS OR SERVICE PROVIDERS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES AND REGARDLESS OF WHETHER ANY REMEDY FAILS OF ITS ESSENTIAL PURPOSE. BECAUSE SOME JURISDICTIONS DO NOT ALLOW ALL OR SOME OF THE FOREGOING EXCLUSIONS OR LIMITATIONS OF LIABILITY, THE PRECEDING LIMITATION MAY NOT APPLY TO YOU.

[jcm]:     https://twitter.com/jpluscplusm
[adam]:    https://twitter.com/adamwright
[ftse]:    https://en.wikipedia.org/wiki/Fundamental_theorem_of_software_engineering
[terms]:   https://run.pivotal.io/policies/terms-of-service/
[paper]:   http://research.google.com/pubs/pub35290.html
[youtube]: https://www.youtube.com/watch?v=Pfvj5dLeDEA
