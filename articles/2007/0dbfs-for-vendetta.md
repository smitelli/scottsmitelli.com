It's a fact of life: Some songs are just louder than others.

Back in the day, it didn't matter all that much. You generally played one album at a time, and at least there was some consistency across all the tracks. You generally set the volume at the beginning, and that single setting did the trick until the end of the album. But in this modern age of custom playlists and iPod Shuffles, you often find yourself jumping between albums, artists, genres and even decades. An '80s hair metal track might lead into a quiet classical piece, and you find yourself fumbling for the volume knob to turn things up to a level where you can hear something. And when that's over, an overly processed modern-day pop track comes along and practically blows out your eardrums.

This is a problem the radio industry has dealt with for a long time, and they've worked out a solution called compression. In simple terms, they crank the volume up so that the quiet sections become loud. And instead of allowing the loud sections to become super-loud, they simply limit those sections to a certain maximum volume. The end result is that everything, from a quiet piano introduction to a screaming guitar-laden rock chorus, ends up sounding equally loud to the human ear. Broadcasters love this, because it ensures that they never broadcast anything louder than the maximum levels permitted by the FCC and other regulators, while at the same time making everything sound uniform and loud to the listener. Compression allows the listener to use a "set it and forget it" mentality, and yet still be able to hear everything that comes along. (In fact, some broadcasters feel the listeners can't be trusted to operate the volume knobs on their radios in the first place.)

The obvious problem with this, of course, is that it takes an entire dimension away from the music. Some songs rely heavily on the contrast between quiet passages and dramatic impacts; it makes the music more interesting. It's called dynamic range -- the difference you have between your loudest and softest points. Compression takes that away by making everything loud, from beginning to end. And while that might be alright in a car or other noisy environment, that's not how this stuff is supposed to be enjoyed. There has to be a different way to do it.

Enter Replay Gain. It has a simple overall goal, to give all your tracks the same perceived volume **without** creating distortion or reducing the dynamic range. So how does it purport to do that? Well, an analyzer program goes through each audio file you have on your drive (usually MP3s, but it works with FLAC and others), from beginning to end, and computes the amount of volume and energy they contain. Some analyzers even go as far as to weigh certain frequency bands with more importance than others, since the human ear is more sensitive to them. In the end, it comes up with an accurate indicator of track's loudness. You specify a "target volume" (usually 89 dB SPL) and the analyzer subtracts the track's volume from the target. That value gets written into an ID3v2 field, and that's all that happens. The audio data's levels aren't changed, the file isn't recompressed, all it does is re-write a tag. When you go to play this track, your audio player reads the Replay Gain tag and adjusts its playback volume based on its value. With every song playing at a different and individually tailored volume, everything sounds uniform.

There's an interesting pattern that emerges from all this. The analyzer usually decides that files are **louder** than 89 dB SPL, and they need to have their volume **decreased** in order to be brought to a normal volume. While compression blindly makes everything louder and chops off the peaks to normalize the levels, Replay Gain reduces the volume on a track-by-track basis to ensure that they sound the same to your ears. Replay Gain can also consider tracks that belong to an album as a group, so that it can preserve the intentional volume differences that often occur between tracks on the same album.

I recently ran a Replay Gain analysis on my entire music library. A miserably boring job that took my desktop three nights to complete. But when it was all over, I was able to do something I was never able to do before... I could sort my music by loudness.

So here, for your enjoyment, are the 20 loudest songs I have in my library.

<table>
<tr><th>Rank</th><th>Track Gain</th><th>Artist - Title</th><th>Album (Year)</th><th>Producer(s)</th></tr>
<tr><td>1.</td><td>-14.22 dB</td><td>Red Hot Chili Peppers - Parallel Universe</td><td>Californication (1999)</td><td>Rick Rubin</td></tr>
<tr><td>2.</td><td>-13.82 dB</td><td>The Hives - Main Offender</td><td>Veni Vidi Vicious (2000)</td><td>Pelle Gunderfelt</td></tr>
<tr><td>3.</td><td>-13.52 dB</td><td>Simple Plan - I'm Just A Kid</td><td>No Pads, No Helmets... Just Balls (2002)</td><td>Arnold Lanni</td></tr>
<tr><td>4.</td><td>-13.44 dB</td><td>Hoobastank - Ready For You</td><td>Hoobastank (2001)</td><td>Jim Wirt</td></tr>
<tr><td>5.</td><td>-13.37 dB</td><td>Red Hot Chili Peppers - Get On Top</td><td>Californication (1999)</td><td>Rick Rubin</td></tr>
<tr><td>6.</td><td>-13.17 dB</td><td>Simple Plan - Worst Day Ever</td><td>No Pads, No Helmets... Just Balls (2002)</td><td>Arnold Lanni</td></tr>
<tr><td>7.</td><td>-13.12 dB</td><td>Caesars - Jerk It Out</td><td>39 Minutes Of Bliss (In An Otherwise Meaningless World) (2003)</td><td>Johan Forsman, Joakim &Aring;hlund, Klas &Aring;hlund</td></tr>
<tr><td>8.</td><td>-13.11 dB</td><td>Red Hot Chili Peppers - Purple Stain</td><td>Californication (1999)</td><td>Rick Rubin</td></tr>
<tr><td>9.</td><td>-13.08 dB</td><td>Red Hot Chili Peppers - Otherside</td><td>Californication (1999)</td><td>Rick Rubin</td></tr>
<tr><td>10.</td><td>-12.96 dB</td><td>Red Hot Chili Peppers - I Like Dirt</td><td>Californication (1999)</td><td>Rick Rubin</td></tr>
<tr><td>11.</td><td>-12.94 dB</td><td>Red Hot Chili Peppers - Easily</td><td>Californication (1999)</td><td>Rick Rubin</td></tr>
<tr><td>12.</td><td>-12.79 dB</td><td>The Mars Volta - Take The Veil Cerpin Taxt</td><td>De-Loused In The Comatorium (2003)</td><td>Rick Rubin, Omar Rodriguez-Lopez</td></tr>
<tr><td>13.</td><td>-12.77 dB</td><td>Red Hot Chili Peppers - This Velvet Glove</td><td>Californication (1999)</td><td>Rick Rubin</td></tr>
<tr><td>14.</td><td>-12.74 dB</td><td>Hoobastank - Give It Back</td><td>Hoobastank (2001)</td><td>Jim Wirt</td></tr>
<tr><td>15.</td><td>-12.61 dB</td><td>Everclear - Overwhelming</td><td>Songs From An American Movie, Volume 2: Good Time For A Bad Attitude (2000)</td><td>Art Alexakis</td></tr>
<tr><td>16.</td><td>-12.58 dB</td><td>Red Hot Chili Peppers - Around The World</td><td>Californication (1999)</td><td>Rick Rubin</td></tr>
<tr><td>17.</td><td>-12.40 dB</td><td>Green Day - Fashion Victim</td><td>Warning: (2000)</td><td><em>self-produced</em></td></tr>
<tr><td>18.</td><td>-12.37 dB</td><td>Red Hot Chili Peppers - Right On Time</td><td>Californication (1999)</td><td>Rick Rubin</td></tr>
<tr><td>19.</td><td>-12.30 dB</td><td>Red Hot Chili Peppers - Californication</td><td>Californication (1999)</td><td>Rick Rubin</td></tr>
<tr><td>20.</td><td>-12.29 dB</td><td>System Of A Down - Innervision</td><td>Steal This Album! (2002)</td><td>Rick Rubin, Daron Malakian</td></tr>
</table>

(Note that some tracks have been omitted, mostly things like theme songs that were taped off the TV. I only put bona-fide, you-can-buy-these-at-a-store songs up here.)

Take a moment to let all this sink in. The loudest song has a Replay Gain value of -14.22 dB. That means the volume has to be turned DOWN by more than 14 dB to end up at 89 dB SPL, a comfortable level. To put that in perspective, a 12 dB reduction of any audio signal would quarter the voltage going to the speakers. A waveform displayed in an audio editor would be 25% of the unmodified signal. That's a pretty damn big change. These songs are way too loud. Way, way too loud. In an effort to sell more albums, or to be more friendly to the radio biz, or just to slowly cause tinnitus in the nation's youth, somebody made a decision to try to make the loudest sound they possibly could and chisel it onto a CD. Every one of these songs exhibits an absurd amount of digital clipping, and they're fatiguing and just downright unpleasant to really listen to.

I put the year and record producers up to make a point as well. These atrocities are happening right now. As over-compressed and loud as people often say the '80s were, it's nothing compared to this new generation of loudness warriors. Personally, I just don't understand it. A CD (and pretty much any 16-bit recording system) is capable of reproducing a signal that's as quiet as -90 dB. I just don't understand why these producers -- especially Rick Rubin -- think it's such a crime to have the level meters dip below -6 dB. It's been many a year since a song with a lot of dynamic range made the Billboard charts. And that's really a shame.

I'm a pretty forgiving person. I don't really care if your song only uses the same three chords we've all heard before. I don't care if your drummer's a MIDI sequencer. I don't care if your lead singer is the epitome of emo or if he screams all the lyrics. All those things can be forgiven. But the one inexcusable sin, the single fatal transgression, is to make your track too loud. In this day and age, with all the technology we have to accurately capture the sounds around us, this shouldn't happen. I'm not trying to sound like some holier-than-thou, crotchety old man who complains about kids listening to the hippety-hop while they wear their baggy pants on my lawn. I'm just trying to point out that these songs sound like shit.

They really do.
