+++
title = 'The Sort of Face'
description = 'Inspired by the popular (and eventually {{% link newyorker-horse-ebooks-is-human-after-all %}}debunked{{% /link %}}) Twitter account {{% link twitter-horse-ebooks /%}}, The Sort of Face is my attempt at creating a Twitter bot that generates funny gibberish.'
date = 2011-09-01
fuzzyDates = 'ym'

[[infoBox]]
key = 'Source Code'
value = '{{% link sort-of-face-source true /%}}'

[[infoBox]]
key = 'Was Once Active At'
value = '{{% link twitter-sort-of-face /%}}'
+++

In the fall of 2011, a Twitter account called {{% link twitter-horse-ebooks /%}} gained notoriety for tweeting nonsense text, often tangentially related to horses and the equine arts. I participated in a series of heated discussions with coworkers over how the text was being generated---I contended the ratio of "hits" was far too high to be the result of a simple Markov chain, and while some phrases could be found in the {{% link project-gutenberg /%}} corpus, many phrases returned zero results in a Google search. I surmised that there were probably people working behind the scenes to curate the output, but I tried my best to write a bot that I could use to prove myself wrong. **The Sort of Face** was my attempt at creating a bot that mimicked @horse_ebooks without any day-to-day human intervention at all.{{% margin-note feature %}}{{% picture stem=profile-pic alt="A coyote making a sort of a face." %}}The profile picture is a nature photograph (presumably copyrighted, although I have lost track of the source) of a coyote making a sort of a face. I found the original on Google Image Search using some variant of "sort of face" as the search query. There may be something medically significant about the sort of facial expression it's making.{{% /margin-note %}}

(Several years later, it would be revealed that {{% link newyorker-horse-ebooks-is-human-after-all %}}@horse_ebooks was indeed run by humans{{% /link %}}.)

The first iteration of the project used na&iuml;ve text-breaking algorithms on Project Gutenberg files exclusively, which generally produced stuffy output that didn't have nearly the right tone. It did, however, generate its own name and Twitter bio while chopping up a chunk of a work called _The Indiscreet Letter_ by Eleanor Hallowell Abbott:

> More than being absurdly blond and absurdly messy, the Young Electrician had one of those extraordinarily sweet, extraordinarily vital, strangely mysterious, utterly unexplainable masculine faces that fill your senses with an odd, impersonal disquietude, an itching unrest, like the hazy, teasing reminder of some previous existence in a prehistoric cave, or, more tormenting still, with the tingling, psychic prophecy of some amazing emotional experience yet to come. **The sort of face**, in fact, that almost inevitably flares up into a woman's startled vision at the one crucial moment in her life when she is not supposed to be considering alien features.

After rolling ideas around in my head, I remembered an image I had seen a few years earlier: A screenshot of a YouTube video, showing an angry dog barking with a closed-captioning overlay reading "Or Or Or Or Or." I then remembered that YouTube performs automatic speech recognition (ASR) on some videos and its accuracy is, shall we say, imperfect. The plan then crystallized: Fetch the list of trending topics from Twitter, search for one of them on YouTube, filter the results to videos that have an ASR closed-captioning track, and pluck the output from there. The result was vastly improved---Often vaguely topical, using informal prose, and error-filled due to machine transcription.

Since then, The Sort of Face had been extended to randomly tweet using Unicode fullwidth characters for emphasis, to write its text upside-down by misusing the Cyrillic alphabet, and to embellish its output with emoji. It could also switch to a mode where it chooses random dictionary words for its source material, producing templated _Mad Libs_ output like "lobsters gonna lobst" and "The opposite of progress is congress."

In June of 2023, Twitter revoked the OAuth credentials I had been using for almost twelve years without notice or explanation. This revocation broke The Sort of Face, with no provision to regain the necessary API access without paying an unconscionable fee. It was a fun ride, producing over 276,500 tweets that Twitter must now preserve in their data stores (at least until the entire account gets purged for some arbitrary reason).
