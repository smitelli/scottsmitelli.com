+++
title = 'ScottSmitelli.com'
description = 'This is the website you are currently looking at.'
date = 2024-07-01
fuzzyDates = 'ym'

[[infoBox]]
key = 'Source Code'
value = '{{% link scottsmitelli-com-source true /%}}'

[[infoBox]]
key = 'Home Page'
value = '{{% link scottsmitelli-com /%}}'
+++

**ScottSmitelli.com** is a website, and it just so happens to be the website that you are looking at right now. Its purpose, content, and design has gone through several iterations over the years.

{{% figure %}}
{{% picture stem=screenshot alt="Why do you need a screenshot of this website? Why did I make one?" %}}
{{% /figure %}}

## The Good Old Days

This site was originally launched in November 2008 as a showcase for my freelance film and audio work in New York City. It was kept separate from my then-personal website at **Smitelli.com**, which was a basket of experimental software and a {{% link wordpress /%}} blog that was all hosted from my apartment's cable internet connection. Smitelli.com was itself an offshoot of an even older self-hosted website called **Vipersniper** which happened so long ago that the name feels weird to type now.

In December 2012, in conjunction with development of the **[Docroute]({{% relref docroute %}})** CMS, ScottSmitelli.com was reimagined as a more traditional article-and-project based blog and portfolio.{{% margin-note %}}This fundamental redesign reflected my professional shift away from the film industry into software engineering roles.{{% /margin-note %}} The more presentable content from my personal site was migrated over at the same time. Smitelli.com was finally retired and I stopped hosting websites from my home, although its domain still exists for redirects and email hosting.

Docroute wasn't a bad system per se; it never caused me any direct problems and it weathered a few traffic spikes happily. However it was somewhat painful to actually write content for, and every time I wanted to add/change something I felt like my muscle memory had completely atrophied. This high degree of friction---whether real or perceived---dissuaded me from adding much content into Docroute, and the [Archives page]({{% relref archives %}}) shows just how infrequent the updates were from 2013 to 2024.

## Then It Was Now, and Then I Don't Know What Happened

After gaining a substantial amount of experience with {{% link hugo /%}} on another project{{% margin-note side %}}[Cosmodoc]({{% relref cosmodoc %}}), which is _massive._{{% /margin-note %}} I realized how painless and almost _enjoyable_ the writing and publishing experience could be with the right setup. I decided to rebuild this site using everything I had learned. I took the opportunity to refresh the site's design, which had never really considered mobile users before. The existing site content was already in Markdown, so migrating everything into Hugo wasn't terribly complicated.

This site's layout was custom built from scratch, drawing primarily from the {{% link tufte-css /%}} project as its main inspiration. The availability of easy-to-insert margin notes{{% margin-note %}}This is a margin note.{{% /margin-note %}} was important to my future ambitions, as was the ability to easily bundle images and JavaScript files with certain pages but not others. Static file management was always one of the more frustrating aspects of the old Docroute system.

It was also important to me that each of Hugo's {{% link markdown-extended-syntax %}}extended Markdown syntax{{% /link %}} features worked and had sensible styling, permitting me to simply _use them_ whenever I wanted. Docroute didn't support much outside of the basic Markdown syntax, so any instance of a table or code block involved a bunch of HTML and inline CSS. A handful of general-purpose shortcodes rounds out Hugo's feature set.

One of the more unusual ideas I'm trying here for the first time is centralized link management. Wherever I have a link to an external site, I look up the actual URL in a {{% link scottsmitelli-com-links-toml %}}centralized TOML data file{{% /link %}}. The idea is that someday---maybe years from now when links have changed and rotted---I can write a script to check all of the URLs I have ever referenced and either resolve any redirect responses or point to a snapshot on the {{% link wayback-machine /%}}. In the worst case, I can simply mark the target as "dead" to draw a strikethrough on any places in the content where it appears.

It is my sincere hope that the current iteration of this site provides a fitting home for the things I have been meaning to write. I also hope that I manage to write those things.

## Site Colophon

The main body font is {{% link lora-font /%}} and the monospace code blocks use {{% link fira-mono-font /%}}. Navigation and other incidental text uses {{% link ruda-font /%}}. All content management and static file generation is handled by Hugo, and is hosted by an {{% link nginx /%}} server running on {{% link debian /%}}. My web host is {{% link linode /%}} using TLS certificates provided by {{% link letsencrypt /%}}. For the most part, I don't use any content delivery networks or proxies; this is my server talking directly to your device.

This site contains no third-party tracking or analytics scripts, nor does it serve any ads. On typical pages, all the data required to present the content comes directly from this server. The most common exception to this is {{% link mathjax /%}}{{% margin-note %}}I tried briefly to self-host MathJax, but it was _frustratingly_ difficult to get it half-working using Hugo and seemingly impossible to make it work fully.{{% /margin-note %}} for math typesetting, which is served by JSDelivr on pages where it is actively used.

I do not track requests to my sites because, frankly, I do not really care who is visiting or what they're reading. I write this content because I want to, and because I enjoy it. If you do too, great! And if not, also great; I hope you find whatever it is you're looking for elsewhere.

## AI Pledge

Unless explicitly stated otherwise, nothing on this site was produced through the use of AI. All of the text content, images, sounds, and software code that went into this website was conceived and executed by a human's brain. Where labeled AI content does appear, I am usually critiquing or outright ridiculing it.
