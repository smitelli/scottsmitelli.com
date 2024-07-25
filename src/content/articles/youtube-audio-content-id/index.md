+++
title = "Fun with YouTube's Audio Content ID System"
description = "A series of tests designed to try to thwart the audio portion of YouTube's Content ID digital fingerprinting system."
date = 2009-04-19
lastmod = 2010-04-21
+++

{{% box %}}
**Update (April 21, 2010):** The YouTube account I used to upload my test videos, "retnirpregnif," was removed due to a "terms of use violation" in late January or early February of 2010. YouTube never sent me any kind of notice or alert explaining their rationale for the termination of my account, so all I can do is guess. But I'm fairly certain that an actual human pulled the account, not an automated system. The remainder of this article remains unaltered from its original April 2009 state. Most of the techniques described here are antiquated and no longer work. I don't have any new information about which techniques may work today.
{{% /box %}}

Anybody who hasn't been living under a rock knows about {{% link youtube /%}}. It's a video site built entirely around user-submitted content. Anybody can film anything, upload it to the site, and anybody on the internet can watch it if they so choose. Sounds great in theory, but over time it's succumbed to a very basic problem: The users can't be trusted.

Copyrighted materials---TV shows, music videos, concerts, even entire feature films---have popped up on YouTube in huge quantities. Obviously, the copyright owners and content providers don't like this, especially when such free distribution cuts into their bottom line. Back in the day, a copyright holder would have to stumble across an infringing video, contact YouTube, and ask them to take it down manually. It doesn't take a genius to realize that the content providers couldn't keep that up forever, especially as more and more new users kept pouring in.

## Enter Fingerprinting

YouTube narrowly avoided legal trouble by promising the big media companies that they'd {{% link googleblog-state-of-our-video-id-tools %}}develop a system{{% /link %}} that could detect and automatically remove any copyrighted material that was uploaded to the site. But in reality, they didn't actually develop the audio fingerprinting system; {{% link revenews-youtube-audiblemagic %}}they licensed it{{% /link %}} from a company called {{% link audiblemagic /%}}.

Audible Magic originally wrote software for CD duplication companies. When you handed a master disc off to a duplication house, they'd check it with an Audible Magic system first. The goal was to positively identify every song on the disc, as well as the copyright/licensing status, _before_ the company ran off 10,000 copies of your potentially pirated disc.

YouTube jumped at this technology and worked to integrate it into their site. It scanned over all the uploads and generated a "fingerprint" for each video. It would then compare each fingerprint to a database containing practically every copyrighted work that the media companies wanted to keep off the site. If any videos matched, it was assumed that the user has posted copyrighted material without permission and the infringing video was removed.

Some labels got the right idea, though. Instead of demanding that any infringing content be taken down, some chose to {{% link googleblog-making-money-on-youtube-with-content-id %}}promote their material{{% /link %}} or insert links to pay music sites where you could purchase the songs that were being played. That was an amazing idea: It permitted the users to basically do whatever they wanted copyright-wise, while still driving traffic and potential sales to legitimate music retailers.

## Heating Up

That worked well enough for a time, but the media companies weren't satiated yet. A slew of legal threats, negotiations, and all-around chicanery ensued. After all, YouTube was making money by running ads alongside videos which often contained material from these companies, and they all wanted a piece.

Unfortunately, nothing seemed to please Warner Music Group, who {{% link theregister-warner-music-removes-youtube-videos %}}left the talks{{% /link %}} without reaching an agreement. They then demanded that YouTube {{% link ytblog-Gg-mX2mof8c %}}remove every single piece of WMG-owned media on the site{{% /link %}}. Videos disappeared all over the place.

## This Is Where I Came In

I don't consider myself to be much more than a casual YouTube user. I'll upload maybe one or two things a year, but nothing amazing or anything I put any real effort into.

For example, one of my videos depicts three members of my high school's marching band dressed in pajamas at an overly girly sleepover. The song used in the background was "I Know What Boys Like" by The Waitresses. I thought it was hilarious when I was 17, but I had all but forgotten about it five years later.

I was caught by surprise one day when I received an automated email from YouTube informing me that my video had a music rights issue and it was removed from the site. I didn't really care.

Then a car commercial parody I made (arguably one of my better videos) was taken down because I used an unlicensed song. That pissed me off. I couldn't easily go back and re-edit the video to remove the song, as the source media had long since been archived in a shoebox somewhere. And I couldn't simply re-upload the video, as it got identified and taken down every time. I needed to find a way to outsmart the fingerprinter. I was angry and I had a lot of free time. Not a good combination.

I racked my brain trying to think of every possible audio manipulation that might get by the fingerprinter. I came up with an almost-scientific method for testing each modification, and I got to work.

## Methodology

The song chosen for all the tests is "I Know What Boys Like," a 1982 song by the one-hit wonder group The Waitresses. This song was chosen for several reasons:

- It was the first song I ever saw that was identified and removed by YouTube's fingerprinting system.
- It has a very distinctive sound that I thought would be easily identifiable. It's also really repetitive, which probably makes it an easy target for an automated system to detect.
- It's one of the few songs I actually have readily available in an uncompressed format. The majority of my music collection is stored with lossy data compression, which might have impacted the results.
- In general, it's just a terrible song. I wanted to highlight the fact that somewhere out there, somebody thinks this 27-year-old heap is still valuable enough to be barred from YouTube.

The song originally came from a 1990 CD pressing of "The Best of the Waitresses," which I came across during my freshman year of college. I was so surprised to see a copy of this album, I begged the owner to allow me to make a copy for posterity (and also for hilarity). I used Nero Burning ROM to make a bit-perfect copy of the full album onto a CD-R. I then listened to my copy, laughed at the majority of it, then stored it in a CD binder.

Fast-forward to the present day, when I decided to run these tests. I ripped my copy of the album with Exact Audio Copy in "secure" mode. The result was a 16-bit stereo, 44,100 Hz PCM wave file. This was used as the master file for all the tests.

For each test, a duplicate copy of the master file was manipulated. Practically every change to the audio was made in Adobe Audition 3 on Windows. The modified duplicates were saved as 44,100/16 stereo waves and moved over to a Mac.

Each file was loaded into an empty Final Cut Pro sequence. The video settings, although theoretically irrelevant, were always set to 24 FPS, progressive, NTSC 720&times;480 @ 4:3, with 44.1/16 stereo downmix audio. The audio files were matched with a default Text generator which described the test being performed. The resulting video files were saved in DV NTSC QuickTime format.

From there, the files were moved into Apple Compressor where they were batch converted into a format YouTube would accept. I chose the "H.264 for iPod video and iPhone 320&times;240 (QVGA)" setting, which encodes reasonably fast with excellent quality. The final output files were M4V containers with H.264 video and AAC stereo audio.

Finally, the video files were uploaded to my YouTube test account. I chose the name {{% link youtube-user-retnirpregnif /%}}, which is the word "fingerprinter" backwards. The title of each uploaded video was always set to a description of that particular test. In all but one test, the description was set to 'The song is "I Know What Boys Like" by The Waitresses.' I chose that description to see if the presence or absence of a copyrighted song name in any of the metadata fields influenced the detection. The tags, category, and any other fields were left blank, and possibly auto-filled by the uploader.

I considered a test passed if the status line on my account's "Uploaded Videos" page read "Live!" and the thumbnail had been generated. (Also, if the video actually played, that's a big plus.) If a video had a status of "Matched third party content" or I received an email about a particular video, I considered that test failed.

{{% box %}}
**Please note** that these tests are only meant to test the **audio** aspect of YouTube's fingerprinting system. They probably have a similar feature in place to scan for content in the image data, but I make no effort to test that in this document. The video fingerprinter might be susceptible to tweaks like those I describe below, or it might be an entirely different can of worms. I'll leave it to somebody else to figure that one out.
{{% /box %}}

## The Tests

### No Description

For the first test, I uploaded a completely unmodified copy of the entire song, but with a description field that read "No Description." The purpose of this test was to determine if YouTube could still identify the material if none of the user-submitted metadata gave any indication that it was there.

### Reverse

The entire song was reversed. The purpose of this test was to determine how discriminating the fingerprinter was. If the test passed, it would reveal the system's inability to identify a song which is playing backwards.

### Pitch Alteration

{{% margin-note feature %}}{{% picture stem=pitch alt="Pitch Alteration" %}}{{% /margin-note %}} The entire song was modified with Audition's "Stretch" plugin. In all tests, the Precision was set to High, Constant Vowels was off, Preserve speech Characteristics was on, Formant Shift was 0, and Solo Instrument or Voice was on. (Admittedly, it should've been off, but that would've taken friggin' forever to process.)

For these tests, the Stretching Mode was Pitch Shift. The Ratio was changed from test to test to create varying amounts of pitch change.

These tests created an output file with exactly the same length and speed as the source, but with the pitch increased or decreased. These tests were designed to determine if the fingerprinter looks at the "notes" the song is made of.

### Time Alteration

{{% margin-note feature %}}{{% picture stem=time alt="Time Alteration" %}}{{% /margin-note %}} The entire song was modified with Audition's "Stretch" plugin. In all tests, the Precision was set to High, Constant Vowels was off, Preserve speech Characteristics was on, Formant Shift was 0, and Solo Instrument or Voice was on.

For these tests, the Stretching Mode was Time Stretch. The Ratio was changed from test to test to create varying amounts of tempo change.

These tests created an output file with exactly the same notes as the source, but with the speed (tempo) increased or decreased. These tests were designed to determine if the fingerprinter looks at the "beats" and rhythm of the song.

### Resampling

{{% margin-note feature %}}{{% picture stem=resample alt="Resampling" %}}{{% /margin-note %}} The entire song was modified with Audition's "Stretch" plugin. In all tests, the Precision was set to High, and Constant Vowels was off.

For these tests, the Stretching Mode was Resample. The Ratio was changed from test to test to create varying amounts of tempo change.

These tests created an output file with both altered pitch and altered speed relative to the original. Quite simply, the song was played back at a faster or slower rate than the original---similar to a tape being played at the wrong speed. And now I suddenly feel old.

### Noise

The entire song was mixed with varying levels of background noise. In the first round of tests, the song was mixed with varying levels of pure white noise created with Audition's Noise generator.{{% margin-note side %}}Color: White\
Style: Independent Channels\
Intensity: 40{{% /margin-note %}}

For the second round of tests, the entire song was played on a set of M-Audio BX5a studio monitor speakers (chosen because of their flat frequency response &ge;100 Hz, and because they were the only ones I really had available), and recorded into a Canon ZR200 camcorder onto a MiniDV tape. The tape was captured into Final Cut Pro, the resulting 48,000 Hz 16-bit audio was split off to a wave file, and then it was converted back into 44,100 Hz in Audition. The camera was placed at different distances and different angles relative to the stereo field's central axis. No effort was made to keep the room quiet during the trials, and as a result things like heaters, refrigerators, TV flyback transformers, and running water can be heard throughout.

### Amplification/Attenuation/DC Bias

{{% margin-note feature %}}{{% picture stem=amplification alt="Amplification/Attenuation/DC Bias" %}}{{% /margin-note %}} The entire song had its volume adjusted by varying amounts from test to test. For amplification tests, the song was allowed to clip hard at 0 dB, creating a great deal of distortion on the louder trials.

In later tests, the amplification was unchanged, but a positive DC bias was added to the signal, resulting in a great deal of distortion and the type of audio I'm afraid to play on good speakers.

These tests were designed to see if there was any absolute volume below which the fingerprinter couldn't detect the song. Likewise, it tested to see if any amount of digital clipping and distortion could disrupt the detection process.

### Time Chunks

{{% margin-note feature %}}{{% picture stem=chunks alt="Time Chunks" %}}{{% /margin-note %}} The song was trimmed to (n &times; 3) seconds long, where n is a value that changes from test to test. The preserved segment of audio comes from near (but not exactly) the center of the song. From 0 seconds to n seconds, the audio is muted. Likewise, from (n &times; 2) seconds to the end of the song, the audio is also muted. The resulting n seconds at the center of the song are allowed to play. If the song is shorter than (n &times; 3) seconds, the muted sections are shortened so the entire output file is the same length as the source.

In later tests, the muted and unmuted portions were aligned to the head and tail ends of the song, for reasons that will be explained later.

The goal of these tests was to determine how much of the song needed to be present to trigger a positive detection, and if the position of that section had any effect on the detection.

### Stereo Imagery

{{% margin-note feature %}}{{% picture stem=stereo alt="Stereo Imagery" %}}{{% /margin-note %}} The entire song was subjected to a series of filters that modify the audio based on the similarities and differences between the two audio channels.

For two of the tests, the vocals were removed or isolated using Audition's Center Channel Extractor plugin.{{% margin-note side %}}Extract Audio From: 0&deg; phase, 0% pan, 0ms delay\
Frequency Range: 140--20,000Hz\
Volume Boost Mode: off\
Crossover: 100%\
Phase Discrimination: 4.5&deg;\
Amplitude Discrimination: 6dB\
Amplitude Bandwidth: 9dB\
Spectral Decay Rate: 0%\
FFT Size: 32,768\
Overlays: 12\
Window Width: 100%{{% /margin-note %}}

In the third test, both channels' waves were inverted. The phase relationship between left and right were preserved.

In the fourth test, only the right channel's wave was inverted. The left remained untouched. The resulting audio file is completely out-of-phase.

In the fifth test, the two channels were first averaged together, effectively making the file mono. It still had two channels, but they contained identical waveforms. The right channel was then taken out-of-phase in the same manner as the fourth test. The resulting audio file is completely out-of-phase, and when both channels are summed together, they will destroy one another and average out to zero, or total silence.

These tests are designed to see how well the fingerprinter copes with audio with unexpected phase alterations. Also, the later tests attempt to reveal if the fingerprinter considers the files in stereo, or if it first converts them into mono for analysis.

## The Results

### No Description

Video | Modification Performed | Result
:-----|:-----------------------|:------
[FxRVPFT5BKM](https://www.youtube.com/watch?v=FxRVPFT5BKM) | Description field left empty | <div class="fail">FAIL</div>

### Reverse

Video | Modification Performed | Result
:-----|:-----------------------|:------
[dYQn6CW4-VI](https://www.youtube.com/watch?v=dYQn6CW4-VI) | Song was reversed | <div class="pass">PASS</div>

### Pitch Alteration

Video | Modification Performed | Result
:-----|:-----------------------|:------
[7AXCbscz5Ys](https://www.youtube.com/watch?v=7AXCbscz5Ys) | Pitch was lowered 25% | <div class="pass">PASS</div>
[sE27S6bDocw](https://www.youtube.com/watch?v=sE27S6bDocw) | Pitch was lowered 10% | <div class="pass">PASS</div>
[6EBUGz_k5ww](https://www.youtube.com/watch?v=6EBUGz_k5ww) | Pitch was lowered 7% | <div class="pass">PASS</div>
[9m5Z2p2P7YE](https://www.youtube.com/watch?v=9m5Z2p2P7YE) | Pitch was lowered 6% | <div class="pass">PASS</div>
[U9FlSevqiA0](https://www.youtube.com/watch?v=U9FlSevqiA0) | Pitch was lowered 5% | <div class="fail">FAIL</div>
[xMlx7rdpP0I](https://www.youtube.com/watch?v=xMlx7rdpP0I) | Pitch was raised 5% | <div class="fail">FAIL</div>
[rtL0DyACoz0](https://www.youtube.com/watch?v=rtL0DyACoz0) | Pitch was raised 6% | <div class="pass">PASS</div>
[7b_Zy2M9iWU](https://www.youtube.com/watch?v=7b_Zy2M9iWU) | Pitch was raised 7% | <div class="pass">PASS</div>
[mkm0fIuDOOA](https://www.youtube.com/watch?v=mkm0fIuDOOA) | Pitch was raised 10% | <div class="pass">PASS</div>
[RudFV8HlfAI](https://www.youtube.com/watch?v=RudFV8HlfAI) | Pitch was raised 25% | <div class="pass">PASS</div>

### Time Alteration

Video | Modification Performed | Result
:-----|:-----------------------|:------
[vIJhocJdCJg](https://www.youtube.com/watch?v=vIJhocJdCJg) | Time was expanded 25% | <div class="pass">PASS</div>
[WgYeFcSl-bs](https://www.youtube.com/watch?v=WgYeFcSl-bs) | Time was expanded 10% | <div class="pass">PASS</div>
[Z8IUZCceVXc](https://www.youtube.com/watch?v=Z8IUZCceVXc) | Time was expanded 7% | <div class="pass">PASS</div>
[yo8Kg0Ws6zk](https://www.youtube.com/watch?v=yo8Kg0Ws6zk) | Time was expanded 6% | <div class="pass">PASS</div>
[mfNYWnZ9P9M](https://www.youtube.com/watch?v=mfNYWnZ9P9M) | Time was expanded 5% | <div class="fail">FAIL</div>
[e2eg7JsVk2o](https://www.youtube.com/watch?v=e2eg7JsVk2o) | Time was compressed 5% | <div class="fail">FAIL</div>
[1KLRmCJgcwQ](https://www.youtube.com/watch?v=1KLRmCJgcwQ) | Time was compressed 6% | <div class="pass">PASS</div>
[HhgN2Y7ICgU](https://www.youtube.com/watch?v=HhgN2Y7ICgU) | Time was compressed 7% | <div class="pass">PASS</div>
[SDw7JvrfvIg](https://www.youtube.com/watch?v=SDw7JvrfvIg) | Time was compressed 10% | <div class="pass">PASS</div>
[S0C-0RxVe2Y](https://www.youtube.com/watch?v=S0C-0RxVe2Y) | Time was compressed 25% | <div class="pass">PASS</div>

### Resampling

Video | Modification Performed | Result
:-----|:-----------------------|:------
[HuM_gTA-Id8](https://www.youtube.com/watch?v=HuM_gTA-Id8) | Song was slowed down 25% | <div class="pass">PASS</div>
[T5StunpZUeo](https://www.youtube.com/watch?v=T5StunpZUeo) | Song was slowed down 5% | <div class="pass">PASS</div>
[6iFBNPpteog](https://www.youtube.com/watch?v=6iFBNPpteog) | Song was slowed down 4% | <div class="pass">PASS</div>
[lMxy9ZUXXT0](https://www.youtube.com/watch?v=lMxy9ZUXXT0) | Song was slowed down 3% | <div class="fail">FAIL</div>
[LSTj5LhWIwY](https://www.youtube.com/watch?v=LSTj5LhWIwY) | Song was sped up 3% | <div class="fail">FAIL</div>
[Lzt4wIWWTz8](https://www.youtube.com/watch?v=Lzt4wIWWTz8) | Song was sped up 4% | <div class="fail">FAIL</div>
[S-Q7uJ3ErTw](https://www.youtube.com/watch?v=S-Q7uJ3ErTw) | Song was sped up 5% | <div class="pass">PASS</div>
[_v82g7p2Qio](https://www.youtube.com/watch?v=_v82g7p2Qio) | Song was sped up 25% | <div class="pass">PASS</div>

### Noise

Video | Modification Performed | Result
:-----|:-----------------------|:------
[nHAdiiFsSwI](https://www.youtube.com/watch?v=nHAdiiFsSwI) | 0% white noise, 100% song | <div class="fail">FAIL</div>
[V-sOEWQyKyI](https://www.youtube.com/watch?v=V-sOEWQyKyI) | 25% white noise, 75% song | <div class="fail">FAIL</div>
[R1tRH0vBaT4](https://www.youtube.com/watch?v=R1tRH0vBaT4) | 40% white noise, 60% song | <div class="fail">FAIL</div>
[-XF2DYIku18](https://www.youtube.com/watch?v=-XF2DYIku18) | 43% white noise, 57% song | <div class="fail">FAIL</div>
[yuHWKDmItLQ](https://www.youtube.com/watch?v=yuHWKDmItLQ) | 44% white noise, 56% song | <div class="fail">FAIL</div>
[TCOq67P2-f0](https://www.youtube.com/watch?v=TCOq67P2-f0) | 45% white noise, 55% song | <div class="pass">PASS</div>
[5jQqMd07yQk](https://www.youtube.com/watch?v=5jQqMd07yQk) | 50% white noise, 50% song | <div class="pass">PASS</div>
[2wAHwKBIqPY](https://www.youtube.com/watch?v=2wAHwKBIqPY) | 75% white noise, 25% song | <div class="pass">PASS</div>
[w4fXEoJ1Tyw](https://www.youtube.com/watch?v=w4fXEoJ1Tyw) | 100% white noise, 0% song | <div class="pass">PASS</div>
[YnB82m8AA4U](https://www.youtube.com/watch?v=YnB82m8AA4U) | Camera 5' away, 0&deg; off-axis | <div class="fail">FAIL</div>
[DBEicY5e2xI](https://www.youtube.com/watch?v=DBEicY5e2xI) | Camera 12' away, approx. 45&deg; off-axis | <div class="pass">PASS</div>
[y7duUWMSIUM](https://www.youtube.com/watch?v=y7duUWMSIUM) | Camera 31' away, 90&deg; off-axis | <div class="fail">FAIL</div>
[LiR0we4xugk](https://www.youtube.com/watch?v=LiR0we4xugk) | Camera in next room | <div class="pass">PASS</div>

### Amplification/Attenuation/DC Bias

Video | Modification Performed | Result
:-----|:-----------------------|:------
[dOzESZj75OM](https://www.youtube.com/watch?v=dOzESZj75OM) | Volume was reduced 48 dB | <div class="fail">FAIL</div>
[TAZCzTj2ICc](https://www.youtube.com/watch?v=TAZCzTj2ICc) | Volume was reduced 24 dB | <div class="fail">FAIL</div>
[PnOcheExAoA](https://www.youtube.com/watch?v=PnOcheExAoA) | Volume was reduced 18 dB | <div class="fail">FAIL</div>
[FjbBPv-jwfo](https://www.youtube.com/watch?v=FjbBPv-jwfo) | Volume was reduced 12 dB | <div class="fail">FAIL</div>
[7Zrp4FLEtV8](https://www.youtube.com/watch?v=7Zrp4FLEtV8) | Volume was reduced 6 dB | <div class="fail">FAIL</div>
[0cA3Ngsp2Tc](https://www.youtube.com/watch?v=0cA3Ngsp2Tc) | Volume was increased 6 dB | <div class="fail">FAIL</div>
[b06I160C1RE](https://www.youtube.com/watch?v=b06I160C1RE) | Volume was increased 12 dB | <div class="fail">FAIL</div>
[l3ee8Mcemf4](https://www.youtube.com/watch?v=l3ee8Mcemf4) | Volume was increased 18 dB | <div class="fail">FAIL</div>
[HnsPvUIs5Jc](https://www.youtube.com/watch?v=HnsPvUIs5Jc) | Volume was increased 24 dB | <div class="fail">FAIL</div>
[M6eoLBjRaHE](https://www.youtube.com/watch?v=M6eoLBjRaHE) | Volume was increased 48 dB | <div class="fail">FAIL</div>
[uE3Tl5uEWI4](https://www.youtube.com/watch?v=uE3Tl5uEWI4) | 50% positive DC bias was added | <div class="fail">FAIL</div>
[IQaDdBqTd2A](https://www.youtube.com/watch?v=IQaDdBqTd2A) | 100% positive DC bias was added | <div class="fail">FAIL</div>

### Time Chunks

Video | Modification Performed | Result
:-----|:-----------------------|:------
[jHr3rSVAKMM](https://www.youtube.com/watch?v=jHr3rSVAKMM) | 5 second chunk, from center of song | <div class="pass">PASS</div>
[WLathwwq3BQ](https://www.youtube.com/watch?v=WLathwwq3BQ) | 10 second chunk, from center of song | <div class="pass">PASS</div>
[9hPyB0zVZs8](https://www.youtube.com/watch?v=9hPyB0zVZs8) | 15 second chunk, from center of song | <div class="pass">PASS</div>
[NzYoOzdHe5c](https://www.youtube.com/watch?v=NzYoOzdHe5c) | 30 second chunk, from center of song | <div class="pass">PASS</div>
[s7gMeI2CGnw](https://www.youtube.com/watch?v=s7gMeI2CGnw) | 45 second chunk, from center of song | <div class="pass">PASS</div>
[FjcspXseW7Q](https://www.youtube.com/watch?v=FjcspXseW7Q) | 60 second chunk, from center of song | <div class="pass">PASS</div>
[wcBA2ttDszg](https://www.youtube.com/watch?v=wcBA2ttDszg) | 90 second chunk, from center of song | <div class="pass">PASS</div>
[uOPmak49TZg](https://www.youtube.com/watch?v=uOPmak49TZg) | 120 second chunk, from center of song | <div class="pass">PASS</div>
[n5peCQjsdQo](https://www.youtube.com/watch?v=n5peCQjsdQo) | 165 second chunk, from end of song | <div class="pass">PASS</div>
[oJ11oWG8tRI](https://www.youtube.com/watch?v=oJ11oWG8tRI) | 30 second chunk, from start of song | <div class="fail">FAIL</div>
[z-vROygcHbY](https://www.youtube.com/watch?v=z-vROygcHbY) | 15 second chunk, from start of song | <div class="pass">PASS</div>
[o3-HnuDI5Oo](https://www.youtube.com/watch?v=o3-HnuDI5Oo) | 15 second chunk, from 0:15 to 0:30 | <div class="pass">PASS</div>

### Stereo Imagery

Video | Modification Performed | Result
:-----|:-----------------------|:------
[zzoR1h1oKzU](https://www.youtube.com/watch?v=zzoR1h1oKzU) | Vocals were isolated | <div class="fail">FAIL</div>
[ONOTGscMQSU](https://www.youtube.com/watch?v=ONOTGscMQSU) | Vocals were removed | <div class="pass">PASS</div>
[HAd4ejov7sE](https://www.youtube.com/watch?v=HAd4ejov7sE) | Both channels were inverted | <div class="fail">FAIL</div>
[sr9mCB4uTF0](https://www.youtube.com/watch?v=sr9mCB4uTF0) | Song was knocked out-of-phase | <div class="pass">PASS</div>
[iGYzDV-8eEg](https://www.youtube.com/watch?v=iGYzDV-8eEg) | Song converted to mono, then knocked out-of-phase | <div class="pass">PASS</div>

## What I Learned

### ... About the Content ID System

**It's everywhere:** It scans every single newly-uploaded video, no matter if it has a title/description that seems suspicious. It generally finds them mere minutes after the upload completes. And videos uploaded before the system was installed aren't immune either. It looks like it's going through every single video that has ever been uploaded to the site, looking for copyright problems. It sounds ludicrous, but remember that YouTube is backed by Google, and Google has plenty of hardware to throw around. I have no doubt that they'll eventually trudge through every single video, if they haven't already finished. I wonder how much CPU time (and electricity) they squandered on this?

**It's surprisingly resilient:** I really thought it would fail some of the amplification tests. Especially the &plusmn;48 dB tests. One was so inaudibly quiet, and the other was so distorted it was completely unlistenable. It found all of them. Likewise, it could detect the sound amidst constant background noise, until the noise level passed the 45% mark. With that much noise, it overpowers the song you're trying to hide. Likewise, it catches all subtle changes in pitch and tempo, requiring changes of up to 5% before it consistently fails to identify material.

**It's rather finicky:** I can't explain why it was able to detect the camcorder-recorded audio at 5' and 31', but not at 12'. Similarly, the vocal removal/isolation tests should've had similar results. But then again, the effectiveness of the Stereo Imagery tests depends entirely on how the song itself was engineered---Just because it turned out one way for this song, that doesn't mean it will react the same way to the other songs with that same modification.

**It's downright dumb:** Wrap your heads around this. When I muted the beginning of the song up until 0:30 (leaving the rest to play) the fingerprinter missed it. When I kept the beginning up until 0:30 and muted everything from 0:30 to the end, the fingerprinter caught it. That indicates that the content database only knows about something in the first 30 seconds of the song. As long as you cut that part off, you can theoretically use the remainder of the song without being detected. I don't know if _all_ samples in the content database suffer from similar weaknesses, but it's something that merits further research.

**It seems to hear in mono:** When I uploaded the files with out-of-phase audio, the tests consistently passed. When the first out-of-phase test is played back in mono, the resulting audio sounds exactly like the Vocal Remove test (which also passed). When the mono-converted/out-of-phase test is played back in mono, both the channels cancel each other out and the result is (theoretically) silence. This is what the fingerprinter hears, and what it bases its conclusions on.

### ... About YouTube

**Apparently they don't really care about repeat infringers:** I uploaded a total of 82 test videos to them, and received 35 Content ID emails. There are people out there who live in constant fear of a Content ID match, thinking that one single slip-up will get their account pulled and every single one of their videos deleted. Not so. There was a point (when I was uploading "infringing" material en masse) when I received an impressive fifteen Content ID emails in the course of an hour. Nothing happened to the account. Now, if this article becomes popular, then they might pull my test account manually... But as of the release of this article, it hasn't happened yet.

**At some point between 11/22/2008 and 1/19/2009, they changed the way they handle Content ID matches:** Initially, when a video was found to be infringing a copyright, they'd immediately block access to it. You'd get an email that says "We regret to inform you that your video has been blocked from playback due to a music rights issue" and if you didn't click the link in the email and either mute your own video or use AudioSwap on it, nobody would ever see that video again. But now things have changed... They automatically mute your videos now instead of blocking them outright. You still have the option to AudioSwap it, but the emails claim that "No action is required on your part." They conveniently leave out the fact that they silenced the audio. And for what it's worth, AudioSwap is fucking useless. Somebody needed to say it.

**It's very evident why they choose to mute the entire audio track of a positively ID'd video instead of just the part with the problem audio:** The fingerprinter can only reliably say "yes, [one particular song] is in here, somewhere," but it doesn't know exactly where in the video the infringing content starts or for how long it plays. It's far easier to just nuke the entire audio track than try to figure out precisely how to cut into it.

### ... About the Community

**They really enjoy recordings of [pure white noise](https://www.youtube.com/watch?v=w4fXEoJ1Tyw):** I can't explain why people are turning to YouTube to hear this, and why it seems like my test account is the hip place to hear a flat power spectrum. But hey, three comments (almost one and a half of them intelligent) can't be wrong.

### ... About Internet Journalists

They take what they want from an article and latch onto it, and that out-of-context piece becomes the entire story. Quoting myself, from above:

> When I muted the beginning of the song up until 0:30 (leaving the rest to play) the fingerprinter missed it. _[...]_ As long as you cut that part off, you can theoretically use the remainder of the song without being detected. **I don't know if _all_ samples in the content database suffer from similar weaknesses, but it's something that merits further research.**
> <footer>This Very Article</footer>

Perhaps I should've worded this more directly. The fingerprinter only identifies the first 30 seconds _of this particular test song._ I did not check to see if any other song was handled the same way, and I even stated that it would be interesting to research more thoroughly. Frankly it's an absurd thought that anybody would build a detection system with such a consistent blind spot.

I will not single anybody out, but a _disheartening_ number of blogs and journalists interpreted that paragraph as saying "as long as you cut the first 30 seconds off, you can upload whatever song you want!" That's not what I said, and it isn't an accurate statement in the general case. Please try to do better.

## Conclusion

It is quite possible to thwart the YouTube Content ID system, but some methods mangle the song too much to be used in anything useful.

In general, the majority of these workarounds are simply kludges which create noticeable (and often irreversible) changes in the sound of the audio. It's likely that some of these workarounds will never be totally fixed, as the amount of computational complexity required to address some of the time/pitch changes would likely create a tremendous strain on a system that's probably already working as hard as it can.

Reversed audio consistently gets through the fingerprinter, but that's not very useful to human listeners. Any pitch or time alterations will also work, provided you apply a 6% or greater change to the parameter you're adjusting.

Pure noise generators will not thwart the fingerprinter until the amount of noise overpowers the original song. Real-world noise is somewhat hit-and-miss, but the amount of effort required to introduce such noise makes the process less than worthwhile.

Stereo Imagery seems to work well, especially those modifications that make the audio play out-of-phase. Unfortunately, such audio is extremely uncomfortable to listen to in stereo mode, and it suffers from phase cancellation in mono mode, resulting in either missing vocals or total silence.

The most subtle approach is to use a resampling function, which simply increases or decreases the speed of playback. For these modifications, a speed increase of 5% or greater will work, as well as a speed reduction of 4% or greater.

## A 5% Speed Increase? Are You Nuts?

You might think so. But let's take a step back and think about what it truly means.

We base our Western ideas about music around the fact that the A note above middle C is defined as 440 Hz. Now, if we increase the speed of the song by 5%, all the pitches will shift up 5% as well. That same note becomes 462 Hz. (For reference, the A&sharp; above A440 is 466.164 Hz.) In the end, 462 Hz translates to roughly 84 cents above the A. Not quite an A&sharp;, but kinda close.

Whether or not you can hear that depends on your level of familiarity with the song. If it's your favorite song, and you've committed every single note of it to memory, then yes, you'll probably be able to tell that it seems slightly higher. But if it's a song you're not very familiar with, or one you haven't heard in years, you might not be able to tell without referring to the original.

To give you a bit more perspective, consider the fact that people have been doing it for years. American films are shot at 24 frames per second. And American television runs at 30 frames per second (yes, I'm oversimplifying the hell out of this). To play film on our TVs, we simply play every 4th film frame twice and they sync up perfectly (again, gross oversimplification).

But in Europe, and the other PAL territories, the TVs run at 25 frames per second. It's a lot harder to fit 24 film frames into 25 television frames without making an unacceptable "judder" every second. So how do they do it, then? Quite simply, they speed the 24 FPS film (and the audio) up to 25 FPS. This translates into a 4.16667% increase in speed and pitch. And I've never heard any Europeans complain about it. (Actually I have, but they do so in a whiny way that just makes me ignore them.)

## More Forbidden Uploads

The following are 5 songs that I uploaded, knowing full well that the fingerprinter would catch them. (I've recently witnessed videos with these songs either muted or removed entirely.) The left column contains videos with unaltered audio tracks, all of which were detected. The videos in the right column were all resampled up by 5%.

Song | Unmodified | Resampled Up 5%
:----|:-----------|:---------------
Bob James - Angela            | <div class="fail">[pjWenBsdj8o](https://www.youtube.com/watch?v=pjWenBsdj8o) (FAIL)</div> | <div class="pass">[VZTkq1Vpnyk](https://www.youtube.com/watch?v=VZTkq1Vpnyk) (PASS)</div>
Led Zeppelin - The Lemon Song | <div class="fail">[u21PJ34J_hg](https://www.youtube.com/watch?v=u21PJ34J_hg) (FAIL)</div> | <div class="pass">[QM4YiIjNZLI](https://www.youtube.com/watch?v=QM4YiIjNZLI) (PASS)</div>
Atreyu - Falling Down         | <div class="fail">[edYOcRPqdIk](https://www.youtube.com/watch?v=edYOcRPqdIk) (FAIL)</div> | <div class="pass">[jj_eK6v5Vpw](https://www.youtube.com/watch?v=jj_eK6v5Vpw) (PASS)</div>
James Taylor - Mexico         | <div class="fail">[MxTlNQKqmFM](https://www.youtube.com/watch?v=MxTlNQKqmFM) (FAIL)</div> | <div class="pass">[E1tzzyV8UmU](https://www.youtube.com/watch?v=E1tzzyV8UmU) (PASS)</div>
Yes - Tempus Fugit            | <div class="fail">[WXvNbs7hmI4](https://www.youtube.com/watch?v=WXvNbs7hmI4) (FAIL)</div> | <div class="pass">[-t6S_BbybeA](https://www.youtube.com/watch?v=-t6S_BbybeA) (PASS)</div>


## Further Reading

- {{% link audiblemagic-patents /%}}: Five patents, available in PDF form, which give a bit of insight into Audible Magic's core technologies. _(~~Also, I particularly enjoy the fact that the page's title reads "Careers." Somebody on the web team was asleep at the wheel...~~ **EDIT:** As of 4/22/2009, the page title has been corrected.)_
- {{% link wiki-acoustic-fingerprint /%}} on Wikipedia: Gives some links to similar technologies.
- {{% link audiocourses-mono-compatibility-and-phase-cancellation /%}}: A brief description of phase, and why two out-of-phase signals summed together will destroy each other.
- {{% link pal-4-percent-speedup /%}}: A guy who explains (then complains about) the PAL 4% speedup.
- {{% link adobe-audition /%}}: The software used to digitally manipulate the audio files.
- {{% link m-audio-bx5a /%}}: The speakers used in the second round of Noise tests.
- {{% link canon-zr200 /%}}: The camcorder used in the second round of Noise tests. ~~(**Warning:** Annoying-ass Flash applet with undesired sound.)~~
- {{% link wiki-telecine /%}} on Wikipedia: Surprisingly, the best explanation I've been able to find regarding how film frame rates are converted to video.

## Disclaimer

What you do with this information is your own responsibility. I'm not here to condone or condemn the copyright laws in this country. I simply wanted to point out the flaws and idiosyncrasies in a very complex system that has become part of our modern-day culture. Always use your best judgment when deciding what types of things to upload to YouTube or any other website that uses similar technology. Don't be an idiot, and have a nice day.
