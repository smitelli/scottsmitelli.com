+++
title = 'leroux-cache'
description = 'A cache object that _actually_ deletes the least-recently-used items.'
date = 2015-04-01
fuzzyDates = 'ym'

[[infoBox]]
key = 'npm'
value = '{{% link leroux-cache-npm /%}}'

[[infoBox]]
key = 'Source Code'
value = '{{% link leroux-cache-source true /%}}'

[[infoBox]]
key = 'Coveralls Tests'
value = '{{% link leroux-cache-coveralls /%}}'

[[infoBox]]
key = 'Pronunciation'
value = 'Rhymes with "Peru smash."'
+++

**leroux-cache** is a LRU (least-recently used) cache that makes a determined effort to actually remove and garbage-collect items that have expired. Rather than keeping old entries around until memory pressure gets high and then frantically searching for things to purge or overwrite, leroux-cache actively scans for and removes these items.

leroux-cache was inspired by (and originally designed as a drop-in replacement for) {{% link node-lru-cache-source %}}lru-cache{{% /link %}} by Isaac Schlueter. The problem it aimed to solve was high memory usage and occasional unavailability in a system with a large cache with a low hit ratio and "bursty" access patterns. lru-cache would often choke and hang while trying to prune old objects, and a more proactive approach was required.

leroux-cache duplicates the basic API of lru-cache, but internally implements a cycling queue of "sweepers" that are each responsible for cleaning up a small subset of the cache's keyspace. The sweeper queue is always active, regardless of the cache's public activity. Even if no gets/sets occur, the cache is always testing and expiring its contents.

There is also a provision for setting a maximum size for the cache's memory, using a user-defined counting function. This allows for a hard cap on the amount of data the cache can hold, which can help prevent runaway memory usage.

After switching our system from lru-cache to leroux-cache, the response time became more predictable and the spikes of high CPU usage stopped occurring. This may not be the ideal tool for most situations, but it helped tremendously in the case for which it was originally created.

Published on npm under the MIT license.
