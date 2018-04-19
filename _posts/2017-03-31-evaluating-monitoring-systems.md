---
layout: post
title:  "Evaluating Monitoring Systems"
date:   2017-03-31 08:29:42
categories: operations monitoring circonus prometheus honeycomb
---
The state of the metrics collection and monitoring systems world has been giving
me pause for thought recently. I was guiding a client through an evaluation
process. [I believe making active choices is a good thing][active-choices],
rather than sleepwalking into a technology estate.

So I helped them define the things that they cared about, and a scoring system
for each of attributes.

The final list we evaluated absolutely reflected my biases. I just wanted to
pick out 3 things here.

## Prometheus

This is an opionated piece of software.

### What it does and doesn't do

This is a monitoring system and Time-Series Database (TSDB). It allows for:

* instrumentation of services
* metrics collection and storage
* querying
* alerting
* dashboarding / graphing / trending
  * Most people add Grafana for these capabilities

It doesn't do:

* raw log/event collection
* request tracing
* anomaly detection
* durable long-term storage
* automatic horizontal scaling
* user / auth management

In my experience, emitting structured events is a game-changer to the
operability of your systems. It's like upgrading from a spinning hard-drive to
an SSD. Similarly to the disk drive upgrade, I wouldn't want to go back.

Intrumenting your systems so that for each request, they emit a single event
document, and having a metrics collection system that can query those documents
was eye-opening for me.

Previously, I'd littered log lines throughout my code, and maybe added a trace
ID to every log statement so that I could correlate them with an individual
request. This meant that I could ask my Elasticsearch service about the lifecycle
of my request in a given system.

* it is assumed to be running inside your network, with appropriate access
  controls because it's inside your network
* you have a single Prometheus node

### Data model and querying

It uses a labelled data model, rather than hierarchical. I prefer this choice.

You can have a query of `api_http_requests_total{method="post"}`, which can be
achieved in [Graphite][graphite] using `api_server.*.*.post.*`. But doing a
different query of `api_http_requests_total{path="/cart"}` becomes much harder
in the Graphite model.

Graphing ratios becomes simple -- `api_http_requests_errors / api_http_requests_total`

### Pull versus Push

The arguments for pull:

* automatic upness monitoring
  * if it cannot scrape a target, you have a signal that the target is down, and
    can alert on that
* horizontal monitoring
* more flexible
* simpler HA
* less configuration
* yes, it scales

### Circonus

If you're happy with a SaaS, use this product. Amazing product.

### Honeycomb

This is a system for collecting and querying labelled event data. It seems
phenomenally powerful. I hope that client will come back to look it at in a few
months time, when they're further along their journey.

[active-choices]: /on-making-active-technology-choices/
[graphite]:       http://graphite.readthedocs.io/en/latest/
[grafana]:        http://docs.grafana.org/
