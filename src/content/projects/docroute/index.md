+++
title = 'Docroute'
description = 'A dynamic CMS for mostly-static content. This site was powered by Docroute from 2012 to 2024.'
date = 2012-12-01
fuzzyDates = 'ym'

[[infoBox]]
key = 'Source Code'
value = '{{% link docroute-source true /%}}'

[[infoBox]]
key = 'Pronunciation'
value = 'Rhymes with "hawk shout."'
+++

**Docroute** is an experimental content management system with a focus on serving "mostly static" pages. It's designed for situations where a full database-driven CMS is overkill, but where a statically-built site would be inconvenient to update. Its original use case was basically "FTP a new content file to this $5/month shared web host" and see the site update itself automatically.

{{% figure caption="An older version of {{% internal-link scottsmitelli.com /%}} being served by Docroute" %}}
{{% picture stem=screenshot alt="An older version of ScottSmitelli.com being served by Docroute" %}}
{{% /figure %}}

The overall philosophy of Docroute is that the page content should be separate from the presentation templates, without HTML markup leaking into the content. To achieve this separation, the content is written in Markdown (or a hybrid of Markdown with Smarty templating syntax enabled for more complex pages) which gets translated to HTML when the server prepares its response.

URL routing works similarly to a filesystem, with each "level" of the path hierarchy containing an `index.json` file. This file contains configuration for that part of the site, as well as the list of child pages and sub-levels that exist within. This routing scheme can be applied recursively, allowing for arbitrarily deep levels of nesting.

Since the pages are served dynamically, the outer page template is capable of rendering conditional content and styling depending on the route. The dynamic construction of pages also allows changes to the template files to immediately propagate to all pages on the site without needing to rebuild anything or clear caches.

As a relatively small PHP application, Docroute is quite fast at serving content and isn't terribly complicated to manage. Developing and maintaining this project taught me that it's actually much harder to _design_ a CMS than it is to _build_ one.

If I had to do it all over again,{{% margin-note %}}I did do it all over again. {{% internal-link scottsmitelli.com %}}This site switched to Hugo in 2024{{% /internal-link %}} and Docroute is no longer being maintained.{{% /margin-note %}} however, I would choose {{% link hugo /%}} for this task. Many of the ideas I was aiming for in Docroute were achieved more cleanly in Hugo, and the overall opinions and sensibilities of the two projects are really quite close. It also helps to have configuration management in place on this server, which makes it trivially simple to trigger a Hugo build whenever the content in the source Git repo changes.
