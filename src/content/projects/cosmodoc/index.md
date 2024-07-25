+++
title = 'Cosmodoc'
description = "The semi-complete teardown of _Cosmo's Cosmic Adventure_ (1992)."
date = 2021-12-13

[[infoBox]]
key = 'Source Code'
value = '{{% link cosmodoc-source %}}HREF{{% /link %}}'

[[infoBox]]
key = 'Read It Here'
value = '{{% link cosmodoc /%}}'
+++

**Cosmodoc**, described as "the semi-complete teardown of _Cosmo's Cosmic Adventure_," is a documentation website that describes in full detail every aspect of the workings of that game. It was written in conjunction with the **[Cosmore]({{% relref cosmore %}})** project, a reimplementation of the game using the DOS development tools that the original creators used in 1992.

{{% figure caption="{{% link cosmodoc-keyboard-functions-ps2 %}}Cosmodoc, Keyboard Functions page, PS/2 section{{% /link %}}" %}}
{{% picture stem=screenshot alt="Cosmodoc, Keyboard Functions page, PS/2 section" %}}
{{% /figure %}}

The first commits to Cosmodoc were made in the spring of 2019, shortly after the Cosmore project became playable. The first Cosmodoc pages described the game's file formats and overall structure, and as I learned more about the purpose and intentions of different aspects of the Cosmore code, I memorialized that knowledge in Cosmodoc.

Throughout 2019 and 2020 my attention shifted from Cosmore to Cosmodoc and back, sometimes to both, and sometimes to neither. After Cosmore was released to the public in November 2020, I occasionally went back and renamed or restructured things based on something I learned while working on Cosmodoc. I consider both projects to be part of the same larger whole, and an improvement to one should be reflected in the other.

Cosmodoc describes not just the game, but also the PC hardware that the game is designed to run on. Programming for DOS is more like targeting a primitive microcontroller rather than a complete operating system, and learning how the hardware works was a necessary prerequisite to understanding why the game was written as it was. Some of my favorite pages in this regard deal with the {{% link cosmodoc-adlib-functions %}}AdLib synthesizer{{% /link %}}, {{% link cosmodoc-ega-functions %}}EGA video{{% /link %}}, {{% link cosmodoc-joystick-functions %}}joystick{{% /link %}}, {{% link cosmodoc-keyboard-functions %}}keyboard{{% /link %}}, {{% link cosmodoc-pc-speaker-and-timing-functions %}}PC speaker{{% /link %}}, and {{% link cosmodoc-processor-detection %}}CPU detection{{% /link %}}. Even if your interest in PC programming has nothing to to with games, something on one of those pages is bound to feed your curiosity.

The original desire was to completely finish the site before releasing it, and to do so before March 2022 to coincide with the 30th anniversary of the original game's release. As time went on I realized that was an over-ambitious goal that I had no chance of reaching in time, so I instead released it in an incomplete state on December 13, 2021. Since then I have been occasionally adding and revising the content. As of this update,{{% margin-note side %}}July 2024{{% /margin-note %}} the incomplete sections of Cosmodoc all involve either the player's movement or the animation functions for each actor. The player movement code alone is nearly 700 lines of twisty `if` statements, and there are 70+ different actor types whose behavior still needs to be documented.

Cosmodoc is a Hugo website, developed quite similarly to [the one you're reading now]({{% relref "scottsmitelli.com/index" %}}). It is in many ways the technical and spiritual inspiration for this site.
