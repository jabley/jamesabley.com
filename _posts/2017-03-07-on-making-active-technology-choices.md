---
layout: post
title:  "On making active technology choices"
date:   2017-03-07 19:03:42
categories: technology decisions history context
---
*This post was originally written as part of the styleguides repository for
Marks and Spencer Digital. That repository has since been removed from the
internet, which is a very separate, sad tale. The post was needed to prevent
technology choices being imposed on teams by The Architects, whilst at the same
time ensuring the technology estate didn't become an uncontrolled sprawling
garden.*

*I'm republishing it here under Creative Commons BY-SA 4.0*

## Technology choices

These are both top-down, and bottom-up. We’ll follow something like the
[Government Service Design Manual guide to Choosing Technology](https://www.gov.uk/service-manual/making-software/choosing-technology) (subject
to our continuous improvement tweaks!). The headline parts are that you
should:

- make explicit, active choices rather than sleepwalking into something
- start off thinking about capabilities, rather than products/frameworks
- be aware that you should be free to change your mind, and what that means

Tech choices are bottom-up because:

- The team (engineers) should choose tools that they are productive with,
  and enjoy using
- Learning a new thing can be fun. Work **should** be fun
- Heads of Engineering will not tell you to use language/framework X
- Architects will not tell you to use language/framework X

Tech choices are top-down because:

- We want to encourage rotations between teams, and people should not have
  to learn entirely new things to do that
- We want people in teams to be able to do on-call support for products
  other than their own, so some commonality (in terms of operations manuals,
  health checks, logging) is to expected
- We need to be able to hire people to develop and maintain things
- Bus factor is a thing. If you’re the only OCaml dev in the building, sorry!

So esoteric tech choices will need a lot of justification.

## Recording Decisions

There is no monopoly on having good ideas. Anyone can have them,
regardless of title. For these ideas, we need ways of assessing ideas,
and measuring them. We do this with our products, making prototypes,
having hypotheses, and measuring data.

To help us make course corrections over time, we should:

- document these hypotheses
- compare what we thought, whether we were right, and what we’ve learned
  since then

For technology and code, we’re going to use [Architecture Decision Records
(ADRs)][adr]. There are [tools to help work with them](https://github.com/npryce/adr-tools). If you use
Homebrew or Boxen, then it is very [simple and easy to install these tools](https://github.com/jabley/our-boxen/commit/cc7c7723820b29edbd7ef9eea5e14c3bc982d008).

[Here are some examples of them elsewhere](https://github.com/search?l=markdown&q=user%3Aalphagov+adr&type=Code&utf8=%E2%9C%93).

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">On making active technology choices</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://jamesabley.com/on-making-active-technology-choices/" property="cc:attributionName" rel="cc:attributionURL">James Abley</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.<br />Based on a work at <a xmlns:dct="http://purl.org/dc/terms/" href="https://github.com/jabley/jamesabley.com/tree/gh-pages/_posts/2017-03-07-on-making-active-technology-choices.md" rel="dct:source">https://github.com/jabley/jamesabley.com/tree/gh-pages/_posts/2017-03-07-on-making-active-technology-choices.md</a>.

[adr]: http://thinkrelevance.com/blog/2011/11/15/documenting-architecture-decisions
