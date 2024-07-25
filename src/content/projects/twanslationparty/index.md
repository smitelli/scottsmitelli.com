+++
title = 'twanslationparty'
description = "Working in conjunction with [twitstash]({{% relref twitstash %}}), twanslationparty corrupts the English text in one Twitter account's timeline and posts the result to another account."
date = 2009-04-02
fuzzyDates = 'ym'

[[infoBox]]
key = 'Source Code'
value = '{{% link twanslationparty-source true /%}}'

[[infoBox]]
key = 'Was Once Active At'
value = '{{% link twitter-engrishsmitelli /%}}'
+++

After I wrote **[twitstash]({{% relref twitstash %}})**, one of the first ideas I had was to build a Twitter bot to convert every tweet I sent into broken English (or "{{% link wiki-engrish /%}}") and repost it. The bot eventually grew into an abstract framework to run tweets through any pair of intermediate languages, with a predefined number of "back-and-forth" cycles (similar to the way the site {{% link translationparty /%}} works) and post the output to another account. This framework was packaged into what is now called **twanslationparty**.{{% margin-note feature %}}{{% picture stem=profile-pic alt="Anime Scott" %}}The profile picture is a drawing of my face in an anime style, done by my good friend {{% link darrell-stark /%}}. Be sure to leave him an email with _SOUP SOUP!_ as the subject line and no additional content.{{% /margin-note %}}

twanslationparty is a PHP script, invoked by the system cron immediately after a twitstash run has completed. The database schema is simple, maintaining a one-to-one mapping of source tweet ID and destination tweet ID. If a new tweet is found in the source table that does not have a corresponding entry in the destination table, the tweet is considered "new" and processing proceeds. If any tweets become marked `deleted` in the source table, twanslationparty deletes the corresponding corrupted tweet from the destination account.

The translation uses the {{% link ms-translator-api /%}}, translating all input text from English to Japanese and then back to English. It repeats this cycle three times, or until the output text exactly matches the output of the previous cycle (thus rendering future translation cycles pointless). In the decade since this bot was originally created, machine translation has become _much_ better, to the point where the output text usually matches the input text very closely. On rare occasions, however, the translation can be so laughably bad that I can't fathom how it produced the output it did.

twanslationparty attempts to salvage URLs, @mentions, and #hashtags whenever it can, allowing the bot's output to thread correctly in conversations between the source account and other users. This is often annoying and inappropriate, and that's exactly the point of the project's existence.

In May of 2023, Twitter revoked the OAuth credentials I had been using for all of my projects without notice or explanation. This revocation broke twitstash, which prevented twanslationparty from seeing updates and responding to them. That was the push I needed to finally stop posting content to Twitter entirely. I have since removed all of my original tweets (and the "twanslated" derivatives) from the site and stopped running these projects, but it was fun while it lasted.
