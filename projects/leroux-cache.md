**leroux-cache** is a LRU (least-recently used) cache that makes a determined effort to actually remove and garbage-collect items that have expired. Rather than keeping old entries around until memory pressure gets high and then frantically searching for things to purge, leroux-cache actively scans and removes these items.

Originally designed to solve high memory usage in an application that had admittedly unusual request patterns, now released to anyone who has a use for it.

MIT license.

* **Source Code:** <https://github.com/smitelli/leroux-cache>

* **Travis CI Builds:** <https://travis-ci.org/smitelli/leroux-cache>

* **Coveralls Tests:** <https://coveralls.io/github/smitelli/leroux-cache>
