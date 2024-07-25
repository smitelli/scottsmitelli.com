+++
title = 'You came and you gave without taking. Like a BitTorrent seed.'
description = "Determining the speed and tempo variations in Barry Manilow's 1974 hit \"Mandy.\""
date = 2008-07-24
+++

{{% epigraph %}}
> Ah, Breakfast Club [soundtrack]! This'll clear out the room at the end of the reception.
> <footer>Yancy Fry, Jr.</footer>
{{% /epigraph %}}

There is an important and often overlooked skill that every DJ should possess: The ability to play a song at the end of an event that will succeed in driving everybody out of the venue. Let's face it, there are always a few stragglers who never seem to want to leave, despite the fact that practically everybody else is long gone. They haven't picked up on the subtle hints, so perhaps its time to blast some "Achy Breaky Heart" to send them on their way. Or how about "MacArthur Park," "Seasons in the Sun," or (God help us) "The Christmas Shoes?"

Might I also suggest "Mandy" by Barry Manilow? Yes, this 1974 dirge lumbers along at a whopping 104 BPM for almost three and a half minutes. Driven mainly by a piano, with a string section during the choruses and a drum kit entering and exiting, this track isn't exactly a toe-tapper. But I doubt anybody would expect anything different for a song about a man's love-induced delirium tremens ("You kissed me and stopped me from shaking").

So why do I bring up this song in particular, when there are probably thousands of other songs that feel too slow and drone too long? Because I have a background in drumming, and every time I hear this song played, it honestly feels like it's speeding up. It feels like the drummer ({{% link jim-young /%}}, as far as I can research) wanted nothing more than for the song to be over as quickly as possible. It's almost as if nobody wants to sit and listen to this thing, including the people that made it!

Whenever I try to bring this point to anybody's attention, they never seem to grasp what I'm saying. Either they've never heard the song, or they lack the sense of rhythm to feel the tempo start to drift. During my last attempt to explain this phenomenon, I facetiously asked, "Do I need to make a graph to explain this to you?"

I realized at that precise moment, yes. Yes I did.

I begrudgingly opened the file in {{% link adobe-audition /%}} and began the thrilling process of placing a cue marker at the exact downbeat of every bar in the song. There were 87 of them that I could hear. (I probably could've estimated the 88th, but the fade-out cut it short and I didn't want to muddy my "research" with a guess like that.) Do you have _any_ idea what it's like to have to scrub 87 different sections of this song trying to find every downbeat? It was painful. But I had to do _something_ while waiting for the cable guy to come and (fail to) unfutz the tap in the basement...

{{% figure caption="*(A shadow of a man, a face through a window, crying in the night.)*" %}}
{{% picture stem=mandy-wave alt="87 points" %}}
{{% /figure %}}

It's a difficult task finding the exact location of each downbeat in a song like this. Generally you'd go with the drums, as there's almost always a kick at each point you want. But not so much here; I had to rely on the bass and in some cases the piano to locate these. I never used the vocals, as they aren't rigidly timed in this song. All in all, I'd say all of these points are accurate to 50 ms or less, which is pretty good considering how ridiculous this whole project is.

Once all the cues were placed and lined up, I merged them all together. This converts each cue from a simple point in time into a range of time - the cue starts at the point where it was originally placed, and extends right up to the cue directly after it. That cue in turn extends out to the cue that follows it, and so on until the end of the file. So cue 23 would correspond to the entire 23rd bar of the song _("... never realized / How ...")_, while cue 24 would contain the entire contents of the next bar _("... happy you made me, oh Ma--- ...")_.

Since the cues on the file are set up to perfectly mirror the bars in the song, we can use Audition's Marker window to see how long each cue is, and by extension, how long each bar is. The longest cue in the song is actually the very first bar of the first verse (bar 9), right after the piano intro. If you listen to the song, you can hear it drag inexplicably as he sings _"I remember all my life"_. Conversely, the shortest bar is 80, during the very last line of the song _("And I need yoooooooou")_. These bars are 2524 ms and 2134 ms long, respectively. Converting them into beats per minute, we get 95.1 BPM and 112.5 BPM, with the remainder of the song somewhere in between the two. The song's overall average tempo is 104.6 BPM (calculated from 87 bars in 199.53 seconds). That's a pretty wide swing, by most standards.

Because I'm a masochist, I threw the raw bar length data into an Excel spreadsheet to see if I could pick an overall trend out of it.

{{% figure caption="*(Caught up in a world of uphill climbing.)*" %}}
{{% picture stem=mandy-graph alt="Mandy, Bar-by-Bar Graph" %}}
{{% /figure %}}

The X-axis is divided up into bars. As you read left-to-right, the song plays normally in time. The Y-axis indicates the length of each measure of the song, with higher numbers indicating longer amounts of time, and therefore slower tempo. The points and the lines are color-coded to make it somewhat easier to tell what part of the song you're at.

- <span class="inline-maroon">**Maroon**</span> - 8-Bar Piano Intro
- <span class="inline-orange">**Orange**</span> - 16-Bar Verse _("I remember all my life")_
- <span class="inline-tan">**Tan**</span> - 8-Bar Chorus
- <span class="inline-maroon">**Maroon**</span> - 4-Bar Piano Interlude
- <span class="inline-orange">**Orange**</span> - 8-Bar Verse _("I'm standing on the edge of time")_
- <span class="inline-tan">**Tan**</span> - 8-Bar Chorus
- <span class="inline-pink">**Pink**</span> - 6-Bar Horn Solo
- <span class="inline-teal">**Teal**</span> - 4-Bar Bridge _("Yesterday's a dream")_
- <span class="inline-tan">**Tan**</span> - 16-Bar Chorus (8-bar chorus played twice)
- <span class="inline-green">**Green**</span> - Lead-Out

There is a squiggly vertical line between bars 70 and 71; this is where the chorus repeats itself, and also when the song modulates up into a higher key. Not that it matters terribly, but I just wanted to include it to maybe help you follow along at home.

Finally, each section has a horizontal blue line. That corresponds to the average of all the points in that particular section of the song. Going by the section averages alone, the song shows a very odd slope, initially slowing down until the first chorus, then speeding back up as the song goes on. (Remember, shorter lengths mean faster tempos.)

What conclusions can I draw from this? Well, first and foremost, I need a life. Secondly, this song definitely slows down until the first chorus or so, at which point it speeds up until it ends. Anything beyond that is left as an exercise for the reader.

...what was I thinking?
