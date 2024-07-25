+++
title = 'Trigger and Freewheel CMS'
description = 'The Trigger and Freewheel CMS powers a {{% link triggerandfreewheel %}}webcomic of the same name{{% /link %}} that I started drawing in 2008 and have been sporadically updating since.'
date = 2011-05-01
fuzzyDates = 'ym'

[[infoBox]]
key = 'Source Code'
value = '{{% link triggerandfreewheel-source true /%}}'

[[infoBox]]
key = 'Try It Out'
value = '{{% link triggerandfreewheel /%}}'
+++

**{{% link triggerandfreewheel /%}}** is, just as the header graphic states, a webcomic. I started drawing it in the spring of 2008 while exercising a Wacom Bamboo pen tablet I had recently purchased. In those days I would update the comic's website by manually uploading images and fiddling with post data in a large PHP array. When this process became too inconvenient to manage, I looked to more full-featured CMS platforms. Not liking any of the WordPress-based plugins, and absolutely loathing the handful I found written in Perl, I decided to build my own with the precise feature set I wanted to see. This CMS is exactly that.

{{% figure caption="Screenshot of the Trigger and Freewheel comic \"{{% link triggerandfreewheel-security-questions %}}Security Questions{{% /link %}}\" from November 5, 2012" %}}
{{% picture stem=screenshot alt="Trigger and Freewheel, \"Security Questions\" from November 5, 2012" %}}
{{% /figure %}}

The site is a regular PHP application using PDO to communicate with the MySQL database which houses the dynamic data. HTML and RSS rendering leverages the Smarty templating engine. New posts are created with the assistance of an administration page, and a cron job continually checks to see if new posts should be publicized to Twitter{{% margin-note %}}In May of 2023, Twitter revoked the OAuth credentials I had been using for all of my projects without notice or explanation. I ultimately decided to leave Twitter, and now the tweet-posting code in this CMS lies dormant. It should still work within their free API tier offering, but I am not interested in verifying that fact now.{{% /margin-note %}} at the stroke of midnight each day. A rudimentary statistics page shows the number of pageviews and image embeds for each comic.

HTTP requests are received by nginx, which directly serves the static site images, CSS, and JavaScript. Dynamic requests are proxied to PHP-FPM, which runs the application code. The server OS is Debian, and all configuration management is done through [my Salt states]({{% relref salt %}}).

This CMS was my first attempt at building a serious MVC application with URL routing and login sessions. I made the conscious choice to avoid using any frameworks, instead forcing myself to do everything "the hard way" from scratch. The result is actually fairly lean, able to withstand occasional spurts of high load from third-party sites.

There has always a wish-list of features to add (image replacement, auto-resizing comic images to the page width...) but none of them were interfering with my workflow enough to warrant any serious development. Today the site still runs, and still hosts all the content I've ever posted. I haven't officially retired from drawing new comics, but they are now rare indeed.
