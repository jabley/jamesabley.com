---
layout: post
title: Devops Defined
categories: technology definition devops
---
It's 2017 and we're still having this discussion? Alright then, here are some
definitions for your consideration...

## Top Definition

DevOps (and latterly Devops) is not a role. It's not a team.

If you advertise for Devops engineer, or Head of Devops, then either you're
doing:

- keyword stuffing to reflect the language that your potential audience
  might use. This can be a recruiting hack done by SEO-aware people,
  begrudgingly
- it very wrong, for the reasons to follow

<span><q>DevOps (a clipped compound of "software DEVelopment" and "information
technology OPerationS") is a term used to refer to a set of practices that
emphasise the collaboration and communication of both software developers and
information technology (IT) professionals while automating the process of
software delivery and infrastructure changes. It aims at establishing a culture
and environment, where building, testing, and releasing software can happen
rapidly, frequently, and more reliably.</q> -- [Wikipedia][wikipedia]</span>
{: class="look-at-me"}

Culture.

Set of practices.

Collaboration and communication.

Not tools.

Not a job description.

Not a role.

Not a team.

My friend (and former colleague[^1]) Gareth Rushgrove wrote some considered
thoughts on this topic as part of the
[Government Service Design Manual][service-manual].
That has since evolved and no longer contains the section on Devops, but it
[remains available in the archive][gds-attic-devops].

<span><q>If your job advertisement says “devops engineer,” I guarantee you are
alienating the very people you want to hire.</q> -- [Nick Stenning][nick]<span>
{: class="look-at-me"}

An often-made comparison is to take agile. Agile is a way of working. You
wouldn't say you were going to hire an agile, so how can you possibly hire a
Devops?

A rejoinder to that is to say that you can have agile engineers. I would say a
strong "No!" to that position. Engineers familiar with agile ways of working?
Sure.

If you are hiring someone to join your Devops team, I know you have at least 2
problems:

1. You think Devops is a role/team
1. You think a single team should be responsible for:
    - culture
    - evolving practices
    - improving communication
    - improving feedback loops

    rather than those being concerns that should cut across the entire organisation[^2].

That screams siloed organisation to me. They're fun, them[^3].

## 2 Devops

To do a bad thing, by ssh-ing onto a server and doing `sudo vi some-file` to fix
the problem. Sometimes done during emergencies to restore normal operation to
some IT system.

**I Devopsed the shit out of it**

## 3 Devops

To break all the things at the same time, thanks to the joys of having automated
large parts of your job. It’s now even easier to break everything, rather than
just a single instance of a thing. We can write code which updates all our
servers at the same time, rather than just updating them one at a time.

**Oh crap, I Devopsed it**

## Who cares?

It could be argued that language evolves and the meaning has changed. Maybe
Devops has been co-opted now, much like there used to be the distinction between
cracking and hacking. These days, no-one really uses the former any more, and
the latter has subsumed the meaning of the former.

Well, I care. I've seen too many organisations not appreciate the subtleties of
looking at flow, feedback loops, and continuous improvement. That's why this
matters.

[^1]: Thought you'd appreciate that, Mazz and Josh ;)
[^2]: [My position on Bi-modal IT hasn't changed][bimodal]
[^3]: Post to follow on that topic

[bimodal]:          /whats-wrong-with-bimodal-it/
[gds-attic-devops]: https://github.com/gds-attic/government-service-design-manual/blob/95c9ad99bfcb724297b6c82691b4610919be21da/service-manual/operations/devops.md
[nick]:             https://twitter.com/nickstenning/status/463431661984956416
[service-manual]:   https://www.gov.uk/service-manual
[wikipedia]:        https://en.wikipedia.org/wiki/DevOps
