+++
# Run with the `--buildDrafts` flag to enable rendering this page
draft = true

url = 'demo'
title = 'The Demo Page'
linkTitle = 'DEMO'
description = "You're tellin' me I need to add a _description_ on top of all this? Man, I dunno..."
subheading = 'This is the subheading.'
date = 2024-06-23
lastmod = 2024-07-24

# Optional template params explicitly set to their defaults; they are listed
# here for completeness and ease of testing.
articleColumns = 'two'
articleForm = 'long'
fuzzyDates = 'ymd'
skipPageHeader = false
skipPageFooter = false
skipTitle = false
skipInfoBox = false

[[infoBox]]
key = 'Info-Box Key 1'
value = 'Info-Box Value 1'

[[infoBox]]
key = 'Info-Box Key 2'
value = 'Info-Box Value 2'

[menus.main]
weight = 1
+++

The demo page begins with a simple paragraph with no special tricks except for a few inline `<code>` tags. The front matter of this page includes a `skipTitle` flag that---when `true`---prevents the `<h1>` from being included on the page automatically. You would then need to insert your own using `# Title` or similar. Or don't! It's up to you.

The `subheading` parameter is optional, and will render directly below the title if it is present. You could have a `subheading` with `skipTitle` together, although I don't know why you would. This layout was designed to fit 2--3 lowercase alphabets on a single line. Did it work?

abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz

{{% small-caps %}}Don't forget to check{{% /small-caps %}}{{% margin-note side %}}Oh those? **Those** are the `small-caps`.{{% /margin-note %}} all this stuff in dark mode. Now we get to test [link text](/) and [anchor text](#) and the deeply mysterious horizontal rule:

---

This site natively supports `<blockquote>` text by prepending lines in the Markdown with `> `. You can even finish the quote with a `<footer>` to end it on a nice attribution.

> You mean I have to _type_ something in here? Like, with my own two _hands?!_ Oh... uh... I have probably done that.
> <footer>Scott Smitelli, <cite>"Scott Smitelli Dot Com"</cite></footer>

Did you notice the italic words in there? Yup, looks like those are working properly as well. While we're on the subject of quotes, there is also the **epigraph** available to us:

{{% epigraph %}}
> I have lots of ideas. Trouble is, most of them suck.
> <footer>George Carlin</footer>
{{% /epigraph %}}

That one requires an `% epigraph %` shortcode. Other than that, it's basically the same as an unwrapped blockquote but with slightly more attention-grabbing styling. A little bigger.

One of the more interesting layout conventions used by this site is the **margin note**{{% margin-note %}}_This_ is a margin note.{{% /margin-note %}}. On a large screen, the margin note appears in the right column immediately adjacent to the point in the text where it was defined. On smaller screens, the margin note becomes hidden by default, marked by an asterisk. Clicking/tapping on the asterisk toggles the visibility of the margin note directly below the line where it was defined.

A similar idea is the **sidenote**, which looks and acts similarly but has a different appearance. Sidenotes{{% margin-note side %}}_This_ is a sidenote.{{% /margin-note %}} are numbered{{% margin-note side %}}Just like this. Notice how the number is _not one_---we have seen these before. They also spread themselves out if too many are defined in a short run of text.{{% /margin-note %}} and the numbers are always shown regardless of screen size. On small screens, they collapse similarly to margin notes.

Next up is the code block:

```css
/* This comment line is 80 columns wide once it gets to the final slash. See? */

:root {
    counter-reset: sidenote-index;

    --bg-color: color-mix(in oklab, yellow 5%, white);
    --fg-color: color-mix(in oklab, white 20%, black);
    --mid-color: color-mix(in oklab, white 85%, black);
    --warning-border-color: hsl(0 100% 70%);
    --warning-background-color: hsl(0 100% 95%);

    --square-color: hsl(216deg 85% 50%);
    --silcrow-color: white;
}
```

If it needs to scroll horizontally, it will. If it doesn't, then there shouldn't be any scroll bars at all:

```python
while True:
    print("uh-oh")
```

This site is also capable of displaying images. I guess that's something that's to be expected, considering websites have had images on them since 1992. At any rate, Hugo has a bit of a weird relationship with images---most of the good post-processing requires using template code, and that's outside the scope of what a demo page should be. So! Here is an overly-large PNG image, stored as a sibling to this page content, and inserted using (something that acts very similarly to) the {{% link hugo-figure-shortcode %}}built-in `% figure %` shortcode{{% /link %}}.

{{% margin-note %}}You could put a margin note here, why not?{{% /margin-note %}}
{{% figure caption="This figure has a `caption=` argument that renders into a `<figcaption>`. It supports Markdown!" %}}
{{% picture stem=grid alt="A 16x9 grid" %}}
{{% /figure %}}

It works pretty well for most purposes. It's certainly enough for a demo page. On mobile browsers, a bit of margin hacking extends the image all the way to the screen edge, kinda like how reader mode has it.

{{% box warning %}}
**Warning:** The viewport calculations assume a fully visible screen without scroll bars. On some desktop browsers with a mouse in use, the scroll bar will knock part of the image off the edges of the screen.

Also, this site has warning boxes, I guess.{{% margin-note %}}Oh my, yes.{{% /margin-note %}}
{{% /box %}}

Separately, the `fullwidth` class can be added to the figure to make it flow out into the margin areas:

{{% figure class=fullwidth %}}
{{% picture stem=grid alt="A 16x9 grid" %}}
{{% /figure %}}

There are a few kinds of lists. I am not really big on restyling them, so they will pretty much stay the way they have always been.

- This is the first item. Although I guess since this is an unordered list, it would more properly be called _an_ item. Well, we've got one.
- And this is the subsequent item.
- Would you believe that this is the penultimate item?
- Finally, we have arrived at the grand finale. I feel like _The New Yorker_ would've put some kind of funny diacritic on the word "finale," but I did not and will not.

{{% margin-note %}}{{% picture stem=grid alt="It is a sidenote grid!" %}}What the heck is _this_ now?!{{% /margin-note %}} With that out of the way, now I have to do all that again for the ordered lists.

1. Initially I had the idea to dump all the names from that song "Mambo No. 5" into the list, that would've been pretty quick. But I looked up the lyrics and they're all over the place.
2. Way too much copy-pasting if you ask me.
3. What, you didn't ask me?
4. For a second I thought this would be the last one of these I had to do. Then I remembered that HTML has another kind of list. Am I ever gonna use it on this site? I mean, I never used it on {{% link cosmodoc %}}the other one{{% /link %}}, so...

Okay, fine, I will make the **description list.** For a while I thought the first word was "definition," but it's "description." Live and learn.

Term One
: This is the text that describes term one. It's not terribly interesting, but it is present and should count for something.

Term Two
: The next term, term two, is different.
    The text was artificially split onto multiple lines by prepending each
    subsequent line with four spaces. This is something that can be done.

Term Three
: Now I'm definitely breaking my editor's syntax highlighting.

    You can put a blank line above a four-space indented line, and that text
    will become a nested paragraph. But not the first line, you see.

    The editor thinks it's a code block, but it's not!

Term Four
Fourth Term
: Oh, yeah, you can stack multiple terms if it strikes your fancy.

Did you know that math is a thing? {{% math %}}$ x = {-b \pm \sqrt{b^2-4ac} \over 2a} ${{% /math %}}. Isn't that a strange thing to see on a website? You can also make it big:

{{< math >}}$$\begin{bmatrix}
    a & b \\
    c & d \\
    e & f \\
\end{bmatrix}$${{< /math >}}

Well that was a whole lot of fun. I really don't know how often I'm going to attempt that. Now it's time to mess around with the heading levels.

# Heading 1

We have already seen this one before. As you can see from the later ones, this heading level is a bit special in appearance. Maybe there is no reason to use it in the middle of the document like this.

## Heading 2

This is more like it. Heading level two is the one most likely to be encountered in the middle of the flow of text, so we want to make sure all the margins and whatnot are nice and well considered.

### Heading 3

Heading level three is also occasionally seen, and will probably be way down there in the lower end of the text.

#### Heading 4

Heading level four is the area where maybe it's time to start reconsidering what you're doing. This is the deepest level where the heading will have a larger font size than the paragraph text.

This is also the first heading level that is omitted from the Table of Contents. To adjust that, mess with the global Hugo config file:

```toml
[markup.tableOfContents]
  startLevel = 2  # this is the default
  endLevel = 6
```

##### Heading 5

What are you doing, friend? Break this mess up into a series of pages. It'll be good for SEO. Or bad. I can't remember which is which anymore.

###### Heading 6

At this point, you may as well be administering an eyesight test to the users. "Better one? Or two?" I dunno, let me see it again. Ugh. One more time? I dunno, they're basically the same.

You know what? I got all the way down here and I don't think I even tried to put a table in here. Do I dare? I mean, I guess I'm gonna have to at some point. Might as well be right now.

A  | B  | C  | Left | Middle | Right
---|----|----|:-----|:------:|-----:
A1 | B1 | C1 | L1   | M1     | R1
A2 | B2 | C2 | L2   | M2     | R2
A3 | B3 | C3 | L3   | M3     | R3

That is about the extent of what you can do with Markdown tables. If you need col/rowspan or per-cell coloring, your best bet is to dump a `<table>` tag in here yourself.

## Audio

This is an embedded audio player containing a little ditty I took from {{% link cosmodoc /%}}. I originally heard this song on a dishwasher!

{{% audio sine-song %}}

Why did I give this a whole heading?

## Test Zone {#demo-test-zone}

This is simply a place where I dump specimens of things I know the Goldmark renderer ought to be able to do, partially to test that everything works and partially to remind myself what the syntax looks like. And there's always the {{% link commonmark-spec /%}}. (That is a link to {{% link commonmark-spec true /%}} if it wasn't clear---there shouldn't be a trailing slash on that URL!)

This Markdown processor supports emoji shortcodes? :bulb:!

~~I have never made a mistake.~~ This is demonstrably false.

- [x] Test if the task lists are supported
- [ ] Determine why I would ever use them

Want to see a {{% link -demo /%}}? Anyway, if I want to test this, I need to end on a paragraph.

### Page Resouces

If this text is <span id="red-capital">red and capitalized</span> then both the CSS and JS injection features are working.

### GoAT

Hugo supports GoAT diagrams directly in the Markdown, although they are difficult to style:

```goat
+--------+--------+--------+--------+
| Packet | Pocket | Socket | Suckit |
+--------+--------+--------+--------*---> What?
| 0x000A | 0x00A0 | 0x0A00 | 0xA000 |
+--------+--------+--------+--------+
```

I'll settle for the font-family, size, and color being correct. Looks like it is.
