+++
title = '{{ replace .File.ContentBaseName "-" " " | title }}'
description = 'The description goes here.'
date = {{ time.Now.Format "2006-01-02" }}
#fuzzyDates = 'ym'

[[infoBox]]
key = 'Source Code'
value = '{{% link source-code true /%}}'

[[infoBox]]
key = 'Read It Here / Try It Out'
value = '{{% link live-page /%}}'
+++

**{{ replace .File.ContentBaseName "-" " " | title }}** is ...
