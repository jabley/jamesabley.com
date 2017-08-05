---
layout: post
title:  "The Basics"
date:   2016-06-23 07:53:37
categories: organisation digital agile
---
I always look for 3 things in a new role:

## How do you deploy changes to production?

This tells you a lot about the maturity of an organisation, and what it values.
If they can deploy to production every day, then they will have answers for a
things like:

- reliable deployment pipelines for getting code from a developer's laptop in
  front of users, delivering value
- monitoring to detect when things are failing

## How do you create production-like environments?

This can be closely related to the first thing. I'm choosing to call it out here
since it increasingly means that a high-performing organisation will have had
interesting conversations about managing user data, scrubbing
personally-identifiable information, mocking out 3rd party services like
email/payments etc.

Part of deploying to production can involve deploying to lower environments.
How are these lower environments managed?

## Show me your feedback loops?

This is the most important one.

I see missing feedback loops. They're everywhere.

Whenever I set up (a process, coding standards, whatever), there are 2 things:

1. Where can I publish it?
1. How can I continually improve it?

I like publishing things, since then they can be linked to, included in search
results, and are more discoverable for people.

I also like setting up how we change and improve those things. That should
itself be subject to a continuous improvement process.

That last part can be a bit odd for people to wrap their heads around it when
they first come across it. Another way of putting it is asking 2 questions:

1. How do we get better?
1. How do we get better at getting better?

This is sometimes called [double-loop learning][double-loop] and is [a really powerful
concept][double-loop-explained].

[double-loop]:           https://en.wikipedia.org/wiki/Double-loop_learning
[double-loop-explained]: https://squiretothegiants.wordpress.com/2017/08/03/double-trouble/
