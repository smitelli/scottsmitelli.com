+++
title = 'Windowbox'
description = '{{% link windowbox /%}} is a photo-hosting website where I post pictures directly from my phone camera.'
date = 2019-11-01
fuzzyDates = 'ym'

[[infoBox]]
key = 'Source Code'
value = '{{% link windowbox-source %}}HREF{{% /link %}}'

[[infoBox]]
key = 'Try It Out'
value = '{{% link windowbox /%}}'
+++

**{{% link windowbox /%}}** is a simple photo-hosting website where I post pictures directly from my phone. I started doing this after graduating from high school in the summer of 2004, posting pictures from my LG VX-6000 camera phone to a self-hosted piece of PHP software called {{% link easymoblog /%}} (later {{% link comoblog /%}}). These projects were fine, but nobody was maintaining them and they were beginning to show their age. Rather than continue trying to hack new features onto my own fork, I started something new.

{{% figure caption="Screenshot of the {{% link windowbox %}}Windowbox main page{{% /link %}}, July 2024" %}}
{{% picture stem=screenshot alt="Windowbox, July 2024" %}}
{{% /figure %}}

The _original,_ original Windowbox was a small PHP app that was created in September 2012 which never really saw most of its core features completed. I soon abandoned that approach in favor of Python 2/Flask/SQLAlchemy. I had never used Flask or SQLAlchemy for anything prior to this, but I rapidly started to appreciate everything the frameworks did for me. The Python 2 version went live in July 2014, roughly ten years after my first mobile pictures were posted. Windowbox was completely rewritten in 2019 using Python 3, and that's the version that runs today.

From a day-to-day perspective, Windowbox works by periodically checking a dedicated IMAP mailbox for new emails. Whenever it finds a new message and verifies it came from me, it posts the image attachment(s) to the site. On my phone, all I have to do is compose an email to Windowbox's contact, attach the picture, and send. The Windowbox app takes care of thumbnail generation, RSS/Atom feeds, and (at one time) syndication to Twitter.{{% margin-note %}}In May of 2023, Twitter revoked the OAuth credentials I had been using for all of my projects without notice or explanation. I ultimately decided to leave Twitter, and now the tweet-posting code in Windowbox lies dormant. It should still work within their free API tier offering, but I am not interested in verifying that fact now.{{% /margin-note %}}

Windowbox also exposes a read-only JSON API for anybody who cares to build a client to interact with it.{{% margin-note side %}}Note to anybody who does this: Share whatever you come up with; I'm curious!{{% /margin-note %}}

Requests to the site reach an nginx server, which directly serves static files and previously-built derivative files via the `X-Accel-Redirect` mechanism. Dynamic pages are proxied to uWSGI, which runs the Windowbox code. Database storage uses MySQL (actually MariaDB these days) and the resized/cropped image files are stored on disk. ExifTool is used to extract metadata from the source images.

The development environment runs in Vagrant, so things work more or less the same no matter what host operating system is running. Windowbox is also my first attempt at reaching 100% test coverage in a complete web app. It's not something I think I would generally recommend anybody try in their daily work, but it's not too difficult to live with since this project's development is relatively quiet today.

One of the things I take pride in is the fact that I was able to migrate all of my old EasyMoblog/CoMoblog posts---the earliest going back to June 2004---into Windowbox. It's an interesting nostalgia trip to click back and see what I was seeing and doing half a lifetime ago. Sure, some photos are embarrassing and others are so grainy and low-resolution that it's unclear what the subject of the picture actually was, but each post is a reminder of some small step I took on the journey from the person I was to the one I now am. I'm glad to have them.
