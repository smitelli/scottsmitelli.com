+++
title = 'Langolier'
description = 'A utility that removes tweets from Twitter after they reach a specified age. Because nothing good ever came from a ten-year-old tweet.'
date = 2020-10-01
fuzzyDates = 'ym'

[[infoBox]]
key = 'Source Code'
value = '{{% link langolier-source true /%}}'

[[infoBox]]
key = 'Has Been Used On'
value = '''
{{% link twitter-smitelli /%}}\
{{% link twitter-engrishsmitelli /%}}'''
+++

I joined Twitter in October 2007 when I was 21 years old. It was a different time, a different world, I socialized with different people and, frankly, I was a different person myself. While I wouldn't say I actively regret anything I've ever posted, I do acknowledge that some of that stuff was geared toward that small community of close friends. There are definitely things I wish I had worded differently. I grew up, I learned tact, diplomacy, and when to keep my damn mouth shut. With all of that in mind, I decided that there was no value in retaining old tweets once they reached a certain age, and I built a tool to automate the process of deleting them.{{% margin-note %}}Actually, I _did_ keep private backups of all my old tweets, including the deleted ones, via **{{% internal-link twitstash /%}}**.{{% /margin-note %}}

**Langolier** is a utility that removes tweets, retweets, and likes from Twitter once they reach a configured age. These tweets can either be gathered live from an API query, or they can be extracted from a downloaded archive file. For small accounts with fewer than 3,000 tweets or so, API mode works great on its own. For older accounts with thousands upon thousands of tweets, API pagination limitations start interfering with the ability to programmatically access older content. In these cases, an archive export is necessary to find all the older IDs that need to be deleted. In typical use cases, Langolier will need to run once (or zero times!) on a downloaded archive, then it can be configured to run periodically against the API.

Langolier is designed around configuration files, so one installation can switch between multiple configurations to manage several accounts. When I was active on Twitter, I ran the tool in API mode every 15 minutes to clean my public accounts. In May of 2023, Twitter revoked the OAuth credentials I had been using for all of my projects without notice or explanation, and that was the push I needed to finally stop posting content there. I have since removed everything from my Twitter histories, and no longer need to run an installation of Langolier for myself.

The name Langolier is taken from a Stephen King collection entitled _Four Past Midnight_. One of its novellas, "The Langoliers," features dreadful flying entities whose sole purpose is to devour time after it has been used up by the present. If that's not the perfect name, heck, I don't know what is.
