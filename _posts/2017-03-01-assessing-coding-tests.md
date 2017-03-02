---
layout: post
title: Assessing coding tests
date: 2017-03-01 17:00:03
categories: technology career
---
A bit of internet that I can point to when I have a conversation with people
about coding tests.

**Do not blindly copy this**

You should adapt it to your context. You should also ensure that the
instructions to the candidate tell them what's important, and what you'll be
looking for. Otherwise you're moving the goalposts, and that's unfair.

Personally, I'm a big fan of Test-Driven Design, but I won't always use it. In
some contexts, I'm just throwing some shit together to learn more about the
problem. I'll take all the shortcuts I can to get to that learning as fast as
possible.

But for a coding test, you're probably after getting the candidate to
demonstrate the things you care about in production code.

## Functionality
* Works with the sample provided?
* Works with other valid test cases?
* Deals sensibly with incorrect input?

## Style
* Readable?
* Idiomatic use of language and language features?
* Good use of OO and/or functional constructs?
* Consistent naming?
* Well & consistently formatted, good use of whitespace?
* No inappropriate hard coding?

## Structure
* Broken into pieces?
* Separation of concerns?
* Single responsibility (and SOLID in general)?
* Loose coupling?
* Domain driven?

## Tests
* Has tests?
* Test driven?
* Unit tests vs. integration tests?
    * Appropriate use of mocking?

## Extras
* Has build script?
    * Extra points for Vagrant or Docker!
* Command line invokable?
* Use of version control?
  * Small, frequent commits?
  * Commit messages tell a narrative?
