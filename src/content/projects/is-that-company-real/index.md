+++
title = 'Is That Company Real?'
description = 'A web service that uses a proprietary and jealously-guarded algorithm to determine if a given company is "real."'
date = 2012-10-01
fuzzyDates = 'ym'

[[infoBox]]
key = 'Source Code'
value = '{{% link isthatcompanyreal-source true /%}}'

[[infoBox]]
key = 'Try It Out'
value = '{{% link isthatcompanyreal /%}}'
+++

After noticing a troubling lack of web services that could objectively determine whether or not a given company was "real," I created **Is That Company Real?** to fill that need. It uses a proprietary and jealously guarded algorithm to measure a given company's "realness" to a degree of accuracy that is unparalleled in the industry.

{{% box %}}**Note:** This industry is incredibly small.{{% /box %}}

{{% figure caption="Is Google a real company? Yes, evidently it is." %}}
{{% picture stem=screenshot %}}
{{% /figure %}}

ITCR consists of two parts: a web app written using the Backbone.js framework, and a backend API service that runs the scoring algorithm. The web app demonstrates a rather novel SVG background animation technique to switch between "real," "fake," error, and idle color schemes.

The scoring heuristic isn't really a secret anymore, and is based on an arbitrary metric: "Real" companies run their own mail servers on their own domains, and "fake" companies do not. That's the big secret. When a URL (or domain name) is entered into the app, it is interpreted as a domain name, the MX record(s) are queried, and their value is compared to the original input. If they match, or their apex domains are "close enough" via fuzzy comparison, the company is real. Otherwise the company is fake. In cases where the domain name doesn't resolve, or there are no MX records, the error view appears.

The web app is a compiled JS bundle built with RequireJS and Uglify, served along with the static assets by nginx. The API component is a PHP script running under PHP-FPM.
