+++
title = 'Everybody Imitates Hypnotoad'
description = "Synthesizing Futurama's \"Angry Machine\" sound effect from scratch using a noise generator and a few filters."
date = 2008-06-05
lastmod = 2025-01-30
+++

{{% margin-note feature %}}{{% picture stem=hypnotoad alt=Hypnotoad %}}All glory to the Hypnotoad!{{% /margin-note %}} Anybody who follows {{% link wiki-futurama /%}} with any degree of loyalty has undoubtedly seen the Hypnotoad at least once. With a cold stare and an ominous hum, this creature can hypnotize almost any living thing to do its bidding. But you don't need me to explain any of this. Read the {{% link wiki-hypnotoad %}}Wikipedia article{{% /link %}} yourself.

My real interest has always been in the sound effect:

{{% audio angry-machine %}}

There's not a lot of information about it available on the internet. In fact, most of what you'll find is pure conjecture. But there are a few things I accept as fact based on the commentaries on the DVD sets (specifically, from "{{% link wiki-day-the-earth-stood-stupid /%}}" and "{{% link wiki-bender-should-not-be-allowed-on-tv /%}}"):

- The sound is called "Angry Machine."
- The effect was temporary, added in a very early stage of animation as a placeholder. They intended to replace it with a "better" sound once the episode was more finalized, but everybody seemed to enjoy the temp sound. So they kept it.
- They claim that the sound was part of their editing system. Perhaps it was an error sound.

There has also been a great deal of {{% link peelified-hypnotoads-sound-effect %}}fan speculation{{% /link %}} about the origin of the sound. Some claim it's the sound of the Millennium Falcon's engines---which are actually based on {{% link facebook-noisemachines-ben-burtt-millennium-falcon %}}the sound of an airplane engine mixed with some other obscure equipment{{% /link %}}---slowed down and played in a loop. Others claim it came from an ancient video game called _Yar's Revenge_. I personally disagree with the Millennium Falcon comparison, and I don't hear the sound in any videos I've found of _Yar's Revenge_ gameplay, so I'll have to cast doubt on that one as well.

In fact, I'm not even sure it's something that would've shipped with an editing package. It's actually a pretty obnoxious sound. If you were working on a deadline and slipped up on your editing workstation, I'm sure the last thing you'd want to hear is that sound blaring through your monitor speakers. Although it's entirely possible that they're misremembering the sound the editing machine made... It could very well have been playing **Utopia Error.wav**:

{{% audio utopia-error %}}

There's a slight bit of similarity. I could see how somebody could mix the two up in their memories. Although God help those editors if they were actually working on the type of Windows 9x-based system that included that sound scheme...

---

**Update (January 2025):** I recently became aware of an {{% link cracked-all-glory-to-the-hypnotoad %}}article on Cracked{{% /link %}}, written in 2022 during the lead-up to the show's then-upcoming eighth season, that recounted the history of the Hypnotoad's creation. The article quoted {{% link imdb-danik-thomas %}}**Danik Thomas**{{% /link %}}, a member of the show's original editing team. He had this to say about the sound:

> Yes! I did that! I recorded that sound way back in October, 1992. I was in Fort Wayne Indiana doing this music video and, during some down time, I was in this cavernous water treatment plant with this great, echo-y sound to it. I had this old analog signal generator that made all these different noises, so I hooked that up to my bass amp and recorded it with my microphone. It was the most obnoxious sound ever.
>
> For years afterwards, I would prank people with that and have it pop up when people were using their computers. It particularly seemed to annoy Paul Calder, who I worked with on Futurama, so I would get him with that a lot. I labeled it "Angry Machine," which just seemed appropriate.
>
> When it came to Hypnotoad, I put Angry Machine in as sort of a temp sound, hoping they'd stick with it for the actual episode, which they did.
> <footer>Danik Thomas</footer>

{{% margin-note %}}I think we might be burying a lede here: He played bass? At a music video shoot? {{% link metal-archives-danik-thomas %}}_This_{{% /link %}} Danik Thomas? If anybody has any information about _that_, I'd be very curious to know more.{{% /margin-note %}}

Danik Thomas and {{% link imdb-paul-calder %}}**Paul Calder**{{% /link %}} were the two editors for the series' first four seasons. His direct account is pretty much corroborated by the DVD commentaries. Together, this is the most definitive proof that we're probably ever going to get that these fan theories are incorrect.

So the sound was generated in real-time by purely analog and physical processes. But there's more than one way to make a noise, as we will soon find out.

---

In my short time as a film sound designer, I've been able to dig through a few sound libraries. I've run across dozens of sounds that you hear constantly in movies and TV shows... the sound of those stupid kids giggling, _the_ red tailed hawk, that office phone that they overuse in "24," and practically every door and platform sound in the original Doom. But nothing like this sound. And certainly nothing with the name "Angry Machine."

On a whim, I captured the sound effect from the last scene of of "Bender Should Not Be Allowed on TV"{{% margin-note %}}There is another instance of the sound effect after the closing credits, during The Curiosity Company's logo card. That recording _appears_ to be in stereo on the English language track, but in reality it is a mono sound with the left channel delayed 12.5 ms and attenuated by 4 dB. This creates an illusion of stereo, but the underlying sound remains mono.{{% /margin-note %}} and loaded it in {{% link adobe-audition /%}}:

{{% figure caption="Angry Machine, spectral view" %}}
{{% picture stem=angry-spectral %}}
{{% /figure %}}

In this graph, a constant tone would appear as a bright horizontal line. Likewise, a transient sound (like a hand clap) would appear as a vertical line. This graph really doesn't show either of those properties. It's more like pure noise. In fact, simple "white noise" would appear as a solid block of yellow. If you look closely, you'll see some patterning and repetition along the horizontal (time) axis, which indicates that there is a bit of echo or reverb applied to the noise. Also, the fact that some frequency bands are brighter than others indicates that there is some filtering going on, undoubtedly to make it sound deeper.

{{% figure caption="Angry Machine, frequency response" %}}
{{% picture stem=angry-frequency %}}
{{% /figure %}}

In this graph, we see the frequency response. It is loudest in the 100--300 Hz range, which gives it its fundamental deepness. It ramps off slowly, with a second peak near 4 kHz. It ramps off very quickly after that. There is a spike at 15.734 kHz, caused by a NTSC television monitor whose horizontal retrace frequency leaked into the audio path. (That's actually a lot more common than you might think, and not just in film/TV. I've seen a lot of it in recorded music as well.) The sharp drop above 20 kHz is caused by the lossy audio compression in the DVD format, which throws out frequencies that it feels the human ear can't detect.

Armed with these two graphs and a lonely night, I set out to figure out exactly what this sound was.

Audition knows how to make three types of noise: White, Pink, and Brown. I made a sample file of each and compared their frequency responses:

{{% figure caption="Comparison of white, pink, and brown noise frequency distribution" %}}
{{% picture stem=noise-frequencies %}}
{{% /figure %}}

White noise is represented by the green line, Pink noise by the red line, and Brown noise by the yellow line. You heard me. After comparing the three, it seemed that Brown noise was the closest to the frequency response of Angry Machine. To clear up misconceptions, Brown noise is **not** a mythical sound that causes people to soil their pants... In fact, it's not even named for the color at all. It's named after Robert Brown, and the mathematical pattern ({{% link wiki-brownian-motion /%}}) the noise is made from.

{{% figure caption="Settings for Audition's \"Generate Noise\" function" %}}
{{% picture stem=generate-noise %}}
{{% /figure %}}

I created a 3-second file of Brown noise at the highest intensity it would allow:

{{% audio step-1 %}}

Hmm... doesn't really have that echoey quality to it. Let's add some delay:

{{% figure caption="Settings for Audition's \"Delay\" plugin" %}}
{{% picture stem=delay %}}
{{% /figure %}}

The original sound effect seems to have evidence of delay at about 50ms and 25ms, which I honestly just eyeballed from the spectral graph. I ran the plugin at 50% for 50ms of delay first, then re-ran it at 50% with a 25ms delay:

{{% audio step-2 %}}

Now we're getting somewhere.

But still, comparing it to the original file, the frequency response still seems wrong. While Angry Machine has powerful lows and a gradual drop-off, our file is still flatly sloped, just like the yellow line in the noise type comparison. Enter the FFT filter:

{{% figure caption="Settings for Audition's \"FFT Filter\" plugin" %}}
{{% picture stem=fft-filter %}}
{{% /figure %}}

I drew this goofy-looking curve through a series of trials (and program crashes). I would tweak a point, apply the effect, and compare the result to the original file. I would then undo, go back, and keep trying. Eventually, I got it pretty close to perfect. As best as I can estimate, here are the points I had drawn:

Frequency | Amplification
---------:|-------------:
21 Hz     | -30 dB
60 Hz     | +6.6 dB
250 Hz    | +19.2 dB
2,350 Hz  | +0 dB
3,800 Hz  | +17 dB
4,400 Hz  | +13.8 dB
8,400 Hz  | +7.2 dB
8,425 Hz  | -19.2 dB
16,500 Hz | -13.2 dB
22,050 Hz | -30 dB

Hey now, that's pretty good!

{{% audio step-3 %}}

In fact, I think we're at a stage now where we can actually compare it to the original file:

{{% figure caption="Spectral comparison of the generated sound and the original Angry Machine" %}}
{{% picture stem=comparison-spectral %}}
{{% /figure %}}

My file is on the left, the original Angry Machine is on the right. For even more proof that these two guys are pretty dang close:

{{% figure caption="Frequency comparison of the generated sound and the original Angry Machine" %}}
{{% picture stem=comparison-frequencies %}}
{{% /figure %}}

Mine is in green above, the original Angry Machine is in red. There are perhaps additional modifications to try---the original Angry Machine has a grittier sound as far as amplitude/loudness is concerned. A compression or distortion pass might bring the replica even closer to the original. Still, considering we started with nothing, we have come quite far.

So there you have it. I don't think the Angry Machine effect is from anything at all. It's just something that somebody synthesized ~~and digitally processed. Who originally did it, and for what purpose, I can't say~~.{{% margin-note side %}}**Update (January 2025):** Based on new interviews released since this article was published, we now know that this was an analog recording made by editor Danik Thomas. See the earlier text.{{% /margin-note %}} But at least now we can have some closure. Not that anybody really cared that much about it anyway.

I'll leave you with a 15-second version of my effect, which I call "Angry Stereo." I named it that because it was built from Brown noise with the "Independent Channels" option set. That gives it a nice effect that's not present in any of the Futurama appearances: it's in stereo.

Enjoy:

{{% audio angry-stereo %}}

