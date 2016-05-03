---
layout: post
title:  "What's wrong with Bimodal IT?"
date:   2016-05-03 20:08:21
categories: digital organisation devops
---
<span><q>Bimodal IT is the practice of managing 2 separate, coherent modes of IT delivery, one focused on stability and the other on agility.<br/>
Mode 1 is traditional and sequential, emphasising safety and accuracy.<br/>
Mode 2 is exploratory and non-linear, emphasising agility and speed.</q> -- Gartner 2014</span>
{: class="look-at-me"}

[Bimodal IT][bimodal] is an approach for managing modes of IT delivery in an organisation, proposed by the analyst company Gartner.

Mode 1 might be your system of record for customers.

Mode 2 might be a new mobile-first bra-fitting web app.

I have many issues with Gartner's approach.

### Things don't exist in isolation

[Systems thinking][sys] shows that we can’t reason about these things in isolation. We need to consider the parts in relation to the whole. For the majority of valuable developments, Mode 2 systems will need to talk to Mode 1 systems.

The [Theory of Constraints][toc] tells us that we can only go as fast as the bottleneck in the system will allow. Ideally, you’re able to iterate your Mode 2 application with continuous delivery, deploying many times a day. That doesn’t really help if you only deploy updates to your Mode 1 system twice a year. So your Mode 2 app will slow down to match the speed of iteration of your Mode 1 systems.

### Plain wrong

<span><q><a href="http://continuousdelivery.com/2016/04/the-flaw-at-the-heart-of-bimodal-it/">Gartner’s model rests on the false assumption that is still pervasive in our industry: that we must trade off responsiveness against reliability…This assumption is wrong.</a></q> -- [Jez Humble][jez]</span>
{: class="look-at-me"}

[Jez Humble and Nicole Forsgren’s research into high-performing organisations][humble-forsgren] says that safety and accuracy, and agility and speed aren’t mutually exclusive. You can be safe and fast.

### Toxic

In my view, it's really harmful to the culture. It actively chooses to create a distinction of:

- marathon runners / sprinters
- them / us
- dinosaurs / mammals
- sad / happy
- rubbish / good
- blockers / enablers
- ancient / modern
- outdated / current
- legacy / new

In my experience, there are enough silos in organisations. Why actively try to create another harmful division?

### Expensive

If you embrace the above toxic aspect, you’ve established the need for dinosaurs. This has the unfortunate side-effect that you need to pay well to encourage people to willingly embrace career obsolescence.

### Wrong problem

Bimodal IT isn't a desired future state. My friend Mat Wall once introduced himself at an early [GDS][gds] meeting involving other parts of government: "Hi, I'm Mat, I'm from the internet, I'm here to help". This was quite a deliberate contrast to the status quo. GDS was set up to provide expertise within central government, with people that could be intelligent customers, and make good things well.

This lack of expertise isn't a problem unique to government!

But it has led to situations where companies aren't using modern, flexible solutions that can be quickly iterated to improve things for their customers.

## A better way

Do what the data says you should do. Improve your delivery pipeline everywhere. [Regular releases reduce risk][garethr].

### Pioneers, Settlers, and Town Planners

[Simon Wardley has written about this model][swardley], derived from Robert Cringley's Accidental Empires.

To do this well, I think it's worth calling out certain aspects:

#### Everywhere must deliver quickly

There should be no layered delivery of things at different speeds. There may be more productionisation / operability concerns for Town Planners, where you have a higher need for resilience. Pioneers might be doing more exploratory, Lean Startup-style "is-this-a-valuable-thing-worth-pursuing?" work. Confirming that solving the problem is valuable to users would be a higher priority than making the solution scale. But all groups are capable of delivering business value in safe, fast, sustainable manner.

#### Rotation

Rotation between the different groups is encouraged. This is good both for:

- the business -- people are exposed to different parts of the product development lifecycle
- individuals -- able to work on a variety of interesting things

I am quite dogmatic that people should learn to Build and Run things. Operating software is a thing developers should care about, and the distinction between operations and development is hopefully a quaint thing that we'll look back upon in the future and shake our heads.

Being exposed to the concerns between building a bullet-proof, resilient system as a Town Planner, versus [spiking][spike] a thing to see if it's worth investing in, are valuable skills. People may well have a preferred location in which they work. But I believe experiencing the full spectrum is valuable for individuals.

[bimodal]:         http://www.gartner.com/it-glossary/bimodal
[garethr]:         https://gds.blog.gov.uk/2012/11/02/regular-releases-reduce-risk/
[gds]:             https://gds.blog.gov.uk/category/gds/
[humble-forsgren]: http://papers.ssrn.com/sol3/papers.cfm?abstract_id=2681909
[humble-flaw]:     http://continuousdelivery.com/2016/04/the-flaw-at-the-heart-of-bimodal-it/
[jez]:             https://twitter.com/jezhumble
[spike]:           http://agiledictionary.com/209/spike/
[swardley]:        http://blog.gardeviance.org/2015/03/on-pioneers-settlers-town-planners-and.html
[sys]:             https://en.wikipedia.org/wiki/Systems_thinking
[toc]:             https://en.wikipedia.org/wiki/Theory_of_constraints
