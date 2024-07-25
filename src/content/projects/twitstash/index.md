+++
title = 'twitstash'
description = "twitstash is a cron script that archives a Twitter user's timeline into a MySQL database for search, data mining, or as a foundation for [twanslationparty]({{% relref twanslationparty %}}) bots."
date = 2009-04-01
fuzzyDates = 'ym'

[[infoBox]]
key = 'Source Code'
value = '{{% link twitstash-source true /%}}'
+++

One of the more lamented aspects of the Twitter API is the fact that {{% link twitter-api-get-statuses-user-timeline %}}there is no way to programmatically retrieve tweets sent more than 3,200 updates ago{{% /link %}}. For heavy Twitter users, that means that tweets sent as recently as a few months ago cannot be retrieved unless the ID number is already known. Because I enjoy archiving things, and because I realized that I might someday want to access some of my earliest tweets, I wrote **twitstash** to archive tweets as they are posted. I started running this script back when I only had a few hundred tweets, and after near-continuous use I can now access and search every single tweet I've ever composed---even though there have been tens of thousands of them posted since.

At its core, twitstash is a PHP script that is run several times an hour via the system cron. During each invocation, my timeline is fetched from the Twitter API and all new tweets and retweets relative to the last run are inserted into the database. A reverse comparison is also done, verifying that all recent tweets in the database still exist in the fetched timeline. If any orphans are found, twitstash marks those rows with an approximate `deleted` timestamp.

Along with tweet text and metadata, twitstash also stores geolocation data (when available) and the expanded values of all shortened URLs. This allows for reconstructing URLs like {{% link tco-before /%}} back into {{% link tco-after /%}} without performing any subsequent HTTP requests or relying on the continuance of Twitter's URL shortener.

The twitstash database was used heavily by a sibling project, **[twanslationparty]({{% relref twanslationparty %}})**. In May of 2023, Twitter revoked the OAuth credentials I had been using for all of my projects without notice or explanation. This revocation broke twitstash, which was the push I needed to finally stop posting content to Twitter entirely. I no longer run twitstash on any accounts, but I keep a local SQL dump of the data to remember the 21,861 tweets I amassed over almost sixteen years.
