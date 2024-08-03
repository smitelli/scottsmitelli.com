# ScottSmitelli.com

My personal website, hosted at [scottsmitelli.com](https://www.scottsmitelli.com/).

## Requirements

This project requires the [Hugo](https://gohugo.io/) Extended build, and was most recently verified against Hugo v0.121.0.

## Build the site

This requires a working `hugo` binary.

```bash
cd src
hugo --printPathWarnings --printUnusedTemplates --templateMetrics
```

A valid absolute path (with protocol) should be provided for `--baseURL` in production environments, although this only affects the OpenGraph, RSS feed, robots.txt, and sitemap.xml outputs.

Output files are stored in the top-level `public/` directory. This is an appropriate place to point an HTTP server's document root. The server's 404 handler should be configured to serve the rendered `404.html` file.

## Regenerate the syntax highlighter CSS

I've been using the [Chroma Playground](https://swapoff.org/chroma/playground/) to try these out.

```bash
cd src
hugo gen chromastyles --style=onedark > assets/scss/syntax.scss
```

## Image Conversion

```console
# Lossy
ffmpeg -i IN.png -codec:v libaom-av1 -still-picture:v 1 OUT.avif

# Lossy with transparency mask
ffmpeg -i IN.png -map 0 -map 0 -filter:v:1 alphaextract -codec:v libaom-av1 -still-picture:v 1 OUT.avif

# Lossless
ffmpeg -i IN.png -codec:v libaom-av1 -crf:v 0 -still-picture:v 1 OUT-LOSSLESS.avif
```

## Audio Conversion

All of the audio examples used on this site (ideally) begin as WAV files. These are hosted to clients that need/care about them, but smaller derivatives are built in MP3 and FLAC. These three file formats were found to have the ideal balance of browser support, audio quality, and file size as of 2024.

```console
# Use joint_stereo 0 in specific cases where the channels are not correlated
ffmpeg -i IN.wav -codec:a libmp3lame -b:a 128k -joint_stereo:a 1 OUT.mp3

ffmpeg -i IN.wav -codec:a flac -compression_level:a 12 OUT.flac
```

## Editing Tips

- If you forget how to do something, do what the Demo page did.
- Don't use Markdown links; use `links.toml` to centralize them.
- Prefer `{{% ... %}}` shortcode delimiters instead of `{{< ... >}}`. The former treats text as Markdown all the way through, while the latter prefers to switch to HTML early. The only context where I'm currently aware of `<>` being preferable is in a multi-line math shortcode body.
- It is not necessary to quote shortcode arguments unless they are multi-word strings.
- Prefer Markdown Extended syntax to accomplish a layout or produce a special typographical symbol. If it doesn't support what you want to do, use a shortcode. If the layout is so bespoke as to be useless to any other page, HTML (or character entities) in the content files is acceptable.
- The content is organized in named directories with `index.md` as the individual file name. This is done to more directly mirror the output tree, and to make it easier to add resources (images, JS, CSS) to pages after they are published.
- Use TOML front matter (`+++ ... +++`).
- Use pound signs for heading levels, not the multi-line dashed style.
- Because asterisks are already doing a lot of work, use hyphens for unordered lists and underscores for emphasis.
- Consider always explicitly aligning each column of a Markdown table (using `:` between the headings and data cells).
- Always use fenced code blocks (three backticks) and don't forget to specify the syntax the block should use.
- Avoid the Markdown image syntax `![...](...)` unless it's absolutely unavoidable -- prefer the `figure` shortcode in the main column or raw `picture` in a margin note.
- Don't get to the 4th heading level.

## Image Sizing

The quick version: **770px** for the main column, **462px** for the margin, and **1400px** for fullwidth.

These values will need to be doubled or tripled depending on the device pixel ratio requirements. As far as height, the current aesthetic aims for nothing higher than 16:9 unless there is a real good reason. (Equivalent heights at this ratio are **433px**, **260px**, and **788px**.)

- "Small screen" width ranges
    - 450px--760px
- "Large screen" width ranges
    - Fullwidth: 630px--1400px
    - Main: 347px--770px
    - Side: 208px--462px
