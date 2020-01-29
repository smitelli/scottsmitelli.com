In the fall of 2011, a Twitter account called [@horse_ebooks](https://twitter.com/horse_ebooks) gained notoriety for tweeting nonsense text, often tangentially related to horses and the equine arts. I participated in a series of heated discussions with coworkers over how the text was being generated -- I contended the ratio of "hits" was far too high to be the result of a simple Markov chain, and while some phrases could be found in the [Project Gutenberg](https://www.gutenberg.org/) corpus, many phrases returned zero results in a Google search. I surmised that there were probably people working behind the scenes to curate the output, but I tried my best to write a bot that I could use to prove myself wrong. **The Sort of Face** was my attempt at creating a bot that mimicked @horse_ebooks without any day-to-day human intervention at all.

The first iteration of the project used naive text-breaking algorithms on Project Gutenberg files exclusively, which generally produced stuffy output that didn't have nearly the right tone. It did, however, generate its own name and Twitter bio while chopping up a chunk of a work called _The Indiscreet Letter_ by Eleanor Hallowell Abbott.

> More than being absurdly blond and absurdly messy, the Young Electrician had one of those extraordinarily sweet, extraordinarily vital, strangely mysterious, utterly unexplainable masculine faces that fill your senses with an odd, impersonal disquietude, an itching unrest, like the hazy, teasing reminder of some previous existence in a prehistoric cave, or, more tormenting still, with the tingling, psychic prophecy of some amazing emotional experience yet to come. **The sort of face**, in fact, that almost inevitably flares up into a woman's startled vision at the one crucial moment in her life when she is not supposed to be considering alien features.

After rolling ideas around in my head, I remembered an image I had seen a few years earlier: A screenshot of a YouTube video, showing an angry dog barking with a closed-captioning overlay reading "Or Or Or Or Or." I then remembered that YouTube performs automatic speech recognition (ASR) on some videos and its accuracy is, shall we say, imperfect. The plan then crystallized: Fetch the list of trending topics from Twitter, search for one of them on YouTube, filter the results to videos that have an ASR closed-captioning track, and pluck the output from there. The result was vastly improved. Often vaguely topical, using informal prose, and error-filled due to machine transcription.

Since then, The Sort of Face has been extended to randomly tweet using Unicode fullwidth character for emphasis, to write its text upside-down by misusing the Cyrillic alphabet, and to embellish its output with emoji. It also randomly chooses a dictionary word list for its source material, producing "Mad Libs" output like "lobsters gonna lobst."

To date, 125,000 tweets have been sent and there is no sign of stopping or slowing down -- at least not until its IP address is banned for scraping or spamming.

* **Original Release:** September 2011

* **Source Code:** <https://github.com/smitelli/sort_of_face>

* **Try It Out:** [@sort\_of\_face on Twitter](https://twitter.com/sort_of_face)

