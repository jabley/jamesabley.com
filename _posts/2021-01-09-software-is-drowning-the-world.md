---
layout: post
title:  "Software is drowning the world"
date: 2021-01-09T13:50:33Z
categories: software organisations
---

One of the many upsides I've had from working at lots of organisations
is that you get to see what's common. Are things like this everywhere?
Frequently, the answer is yes!

An example of this is tech debt.

I see organisations which are running to stand still, and I'm not
sure they realised they're doing that.

What do I mean by this?

Every time you decide to solve a problem with code, you are committing
part of your future capacity to maintaining and operating that code.
Software is never done.

Here's a few examples of demonstrating what I mean:

## Security

1. You write a networked service to solve a business problem. Say
   it has an HTML web UI
1. It has no known security issues
1. Time passes
1. You now have security issues with your code, and you should assess
    whether you need to do work to address these.

WAT?

Humans are terri-bad at writing secure code. And given enough time,
other humans will discover the security holes in your service.

This applies both to code your organisation writes, and the libraries
they use, or the operating systems, or web servers, or ...

### Security Examples

Take your pick from browsing a CVE database, or use
[Snyk](https://snyk.io/) or similar to look at your current codebases.

* TLS / SSL issues:
    * [POODLE](https://en.wikipedia.org/wiki/POODLE)
    * [BEAST](https://blog.zoller.lu/2011/09/beast-summary-tls-cbc-countermeasures.html)
    * [CRIME](https://en.wikipedia.org/wiki/CRIME)
    * [BREACH](https://en.wikipedia.org/wiki/BREACH)
    * [Heartbleed](https://en.wikipedia.org/wiki/Heartbleed)
* [Spring](https://www.cvedetails.com/vulnerability-list.php?vendor_id=15183&product_id=31286&version_id=&page=1&hasexp=0&opdos=0&opec=0&opov=0&opcsrf=0&opgpriv=0&opsqli=0&opxss=0&opdirt=0&opmemc=0&ophttprs=0&opbyp=0&opfileinc=0&opginf=0&cvssscoremin=6&cvssscoremax=0&year=0&month=0&cweid=0&order=1&trc=20&sha=97513f3fa07a803c5507b2cf550af9877acd90f2)
* [Struts](https://www.cvedetails.com/vulnerability-list.php?vendor_id=45&product_id=6117&version_id=&page=1&hasexp=0&opdos=0&opec=0&opov=0&opcsrf=0&opgpriv=0&opsqli=0&opxss=0&opdirt=0&opmemc=0&ophttprs=0&opbyp=0&opfileinc=0&opginf=0&cvssscoremin=6&cvssscoremax=0&year=0&month=0&cweid=0&order=1&trc=70&sha=5369e34293062ebe460c99e6878e0792ac23944c)

### Legislation

1. You write a networked service to solve a business problem. Say
    it has an HTML web UI
1. It has no known legal compliance issues
1. Time passes
1. You now have legal compliance issues with your code, and you should
    assess whether you need to do work to address these.

WAT?

The [General Data Protection Regulation](https://en.wikipedia.org/wiki/General_Data_Protection_Regulation)
addressed organisations not handling data very well.

Privacy and Electronic Communications Regulations – mostly known
for mandating cookie policy.

The Equality Act 2010 (UK) and the Americans with Disabilities Act
1990 (2010 update) for website accessibility. Yes, there was a time
when people didn't consider accessibility when building websites.

Brexit has meant a lot of changes for businesses in the EU and UK.
Software has been rewritten to manage the new trading relationships.
This will continue to happen for a while countries establish new
relationships.

### 3rd parties

1. You write a service to solve a business problem
1. You can build and release it when necessary
1. Time passes
1. You are now unable to build and release the service

WAT?

3rd parties will change their APIs, or how things work. They may
do this for any number of reasons: performance, or security among
them. Older versions become deprecated, and unsupported. And these
older versions will still have new security issues reported against
them. So you need to upgrade, and adapt your code to use the new
API.

People building code libraries will strive to maintain backward
compatibility. But we still get [semver](https://semver.org/) major
version changes, and breaking API changes.

## Implications

Most software needs constant maintenance. Building and operating
software has a cost which you should always factor in when deciding
to solve problems in that way.

A team working in a particular way can only be responsible for a
fixed amount of software. The amount of software should be managed,
otherwise the team will grind to a halt.

## Proposition

> A team working in a particular way

What if we change how they work?

Well yes, there are options there.

I've got a separate post (currently brewing) about Dunbar's numbers,
but for this post, different sized organisations might have different
options. At a certain size, it makes sense to have people dedicated
to developer productivity and creating tools which improve the
capacity of other teams.

You can choose higher-level languages, and use technology stacks
from SaaS vendors which need less time from your people.

There is one option I had planned to spend researching last year
(but I ended up getting a job instead). This feels like potentially
a big market. I've seen lots of organisations with decade-old
codebases which are still running unsupported versions of dependencies
or frameworks.

As a developer, I'm familiar with a hammer, and was curious if I
could use it.

Can we have tooling that automates keeping software up-to-date?

I see this problem in every organisation I've ever worked in, with
all aspects.

Web applications/APIs written in any language. As mentioned above,
there are many reasons that software rots if left unattended. Mobile
apps also have this. Migrating versions of Android, or iOS, or ...

Configuration/manifests for Infrastructure as Code aslo suffer from
this. Terraform hasn't yet released 1.x, but there have been many
changes over the years. If you're using Cloud Foundry or Kubernetes,
you'll [have experienced
changes](https://github.com/doitintl/kube-no-trouble) which mean
you need to do work.

Automating the changes needed in YAML for upgrading from Kubernetes
`n` to `n+1` feels like a widely useful tool.

## Current State

There are some commercial things which do related work.

Snyk, [Renovate](https://github.com/renovatebot/renovate),
[Dependabot](https://dependabot.com/) and other things exist which
can make pull requests to update dependencies. Mpost languages have
a package tool and bumping numbers is pretty straightforward. These
things tend to not be able to manage breaking API changes though.
Bumping a patch or minor dependency upgrade is fine, but a major
one with breaking API changes tends to need a human to get involved.

Why? Could we have a tool that solves this? When a new version of
[Spring](https://spring.io/) is released, could it include an
accompanying set of transformations which will allow the entire
ecosystem to safely and rapidly upgrade?

Having a minor interest in compilers (and having worked on a
commercial interpreter), I tend to think of code editing operations
as transformations, rather than characters. There's been [some
research in transformation-based
editors](https://www.facebook.com/notes/kent-beck/prune-a-code-editor-that-is-not-a-text-editor/1012061842160013),
but I've not seen a lot else.

Major version upgrades could potentially be similarly expressed in
terms of transformations, which similarly might be composed. So if
a class has been removed between major versions of a dependency,
the required transformation might be composed of:

1. Insert new class `my.Y`
1. Implement interface `spring.new.Z`
1. Adapt method `A` from old class `my.Z` onto method `B` in new
    class `my.Y`
1. Adapt parameters from adapted method – a `Context`
    used to be obtained from `ApplicationSingleton` but is now passed
    in explicity
1. etc

And then you would need a serialisation format and publishing
mechanism for these sets of transformations.

The closest I've seen to this is where Google actually did that in
the same target langauge. They [published a tool with for the
language Go](https://blog.golang.org/introducing-gofix), named
[`fix`](https://golang.org/cmd/fix/). It automated upgrades of
existing code before 1.x was released, and since then, they've had
[the Go 1 compatibility document](https://golang.org/doc/go1compat).

Sadly, `fix` appears to have been mostly inactive since then?

I'm interested (academically as well as commercially) in producing
a tool which looked something similar, but much more widely applicable.

So having something that can take code/configuration, generate an
Abstract Syntax Tree (AST), and then apply a set of transformations.
Transformations compose. A large one might be **Upgrade Framework
`n` to `n+1`** involvings lots of smaller transformations. For each
transformation, you'd need to query the AST for usages of the old
API, then try to apply the transformation which maps the old API
to the new API.

I've found [one related paper](https://dl.acm.org/doi/10.1145/1103845.1094832).
Given that it's not gone further, was it too hard, or not viable, or
the wrong time?

## Summary

So I think this would be the next evolution in automated upgrades.
It's seems like a big market – how many companies would pay for you
to solve this problem for them and allow them to concentrate on
business logic rather than plumbing concerns?

But I didn't take the time off I planned to confirm the potential
market and see how hard a problem it would be solve :)

## Further Reading

**Update** I originally published this without a list of references.
I should have done the hard work to include them. Mostly that meant
mining my browser history and Pinboard from February and March 2019
when I spent a chunk of time first looking at this
**for absolutely no reason at all, clients of the time**.

* [Refactoring support for class library migration](https://dl.acm.org/doi/10.1145/1103845.1094832)
* [Automatic Upgrade of Java Libraries](https://ercim-news.ercim.eu/en88/special/automatic-upgrade-of-java-libraries)
  which linked to [a defunct Netbeans plugin](http://web.archive.org/web/20170409031849/http://kenai.com/projects/refactoringng)
* [Autorefactor](http://autorefactor.org/)
* [Walkmod](http://walkmod.com/)
* [Rewrite](https://github.com/Netflix-Skunkworks/rewrite)
    * This has now become [OpenRewrite](https://docs.openrewrite.org/)
      and might be what I'm after, for Java and YAML at least. There is
      an example which (when complete) is supposed to migrate from
      Spring Boot 1.5.x to Spring Boot 2.x.
