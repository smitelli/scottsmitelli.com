+++
title = 'Small WebGL Examples'
description = "Drawing onto a `<canvas>` element doesn't need as much code as online tutorials and example pages might lead you to believe. This page contains a handful of demos that show exactly what you need and almost nothing that you don't."
subheading = "It doesn't take all that much to get useful output."
date = 2024-06-29
lastmod = 2024-07-01
+++

Frequently when learning an unfamiliar technology, I'll find an example implementation that somebody else built. In an effort to understand it, I'll strip it down into the smallest thing that almost works, and then I'll study the almost-working husk to figure out the essence of how it was made. From there, I build it back into the shape of the thing I was originally trying to accomplish. WebGL is one of those technologies that is utterly inscrutable from the outside, with most available sample code spread out across dozens of library files. I realized that I had to actually go through tutorials and scour documentation to figure out how to produce _any_ results.

This page is a demonstration of a couple of different levels of client-side graphics rendering achievable using vanilla JavaScript in modern browsers. These examples were produced partially to test their integration with Hugo, but also to serve as reminders for different starting points of complexity. The goal is to avoid using frameworks and over-architecting things, and instead make the smallest thing that could possibly produce the intended effect.

## 2D Shape Drawing

This first example isn't technically WebGL at all, it simply uses the path drawing methods that the HTML canvas element natively supports. The output is a rotating square with a fill and stroke applied separately, slowly bouncing around inside the bounds of its parent. The canvas adjusts its size automatically as the surrounding page environment changes.

<canvas id="2d-square"></canvas>

The JavaScript code is [here](render-2d-square.js). The relevant page HTML is simply:

```html
<canvas id="2d-square"></canvas>
```

## Into the Second-and-a-Halfth Dimension

This is a proper WebGL implementation of a bouncing spinning square. We do not have the same ability to easily stroke a path like we did with regular canvas drawing, so we make up for it by interpolating colors between the four vertices.

<canvas id="gl-square"></canvas>

Similar to before, the code is [here](render-gl-square.js) and the HTML is:

```html
<canvas id="gl-square"></canvas>
```

As simple a demo as this is, it still requires a list of vertices, a vertex shader, a fragment shader, and a translation/rotation matrix. In spite of all of that, it exhibits display distortion if it draws to a non-square canvas. (What do you want, I didn't want to ugly up the matrix any more than it already was.) Still, it's barely 100 lines long and it appears to work.
