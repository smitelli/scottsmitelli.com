+++
title = 'If it cites em dashes as proof, it came from a tool.'
description = "It's a safe bet that most of us have encountered the age-old admonition to \"never judge a book by its cover\" at some point in our lives. There is a deep wisdom in that advice---wisdom that seems to go completely out the window as soon as a certain type of person spots a certain type of punctuation."
date = 2025-07-07
+++

{{% epigraph %}}
> **Samir:** Well, why don't you just go by Mike instead of Michael?
>
> **Michael Bolton:** No way! Why should I change? He's the one who sucks.
> <footer><em>Office Space</em> (1999)</footer>
{{% /epigraph %}}

Stop me if you've heard this one before: A post is made or an article is shared. Some distance below that, a commenter points out that the text's use of em dashes---these long guys right here---is a dead giveaway that the content was written by AI. {{% link theverge-is-this-shopped %}}They can tell by the pixels.{{% /link %}}

Nobody specifically asks for this analysis. It is not well upvoted. It does not produce any real insightful discussion. Perhaps a reply suggests that the observation is dumb. Once in a blue moon, {{% link hn-commend-em-dash %}}this sort of comment{{% /link %}} drives a petty man to grind out a 3,400 word article. {{% link youtube-and-so-it-goes %}}And So It Goddamn Goes.{{% /link %}}

## I've drawn my little line in the sand.

I cannot begin to describe how viscerally this offends me.

What these people are basically saying is that they have cracked the code. {{% margin-note %}}Or, let's be honest: They have copied a thirdhand observation from some other scoop-sleuthin' schmuck.{{% /margin-note %}} They have acquired the hard-won wisdom, undertaken the extensive training, and are now able to sniff out all the _funny symbols_ that _nobody's keyboard can type_ and clearly this "---" is an _alien invader_ in our _pure and unsullied_ Unicode Basic Latin block. They have a God-given power, the authority, _the right---the **duty**_---to rip the Halloween mask off of this shadowy AI _Scooby-Doo_ villain and expose it once and for all. Save us, O valiant guardian of human expression, from this LLM wolf in Reddit sheeple's clothing!

These people---broadly---are behaving like idiots. Anybody with a Mac keyboard can type an em dash with a three finger salute: Option (&#x2325;), Shift, and Hyphen. For an en dash, omit the Shift. On iOS, simply hold the hyphen key for a moment and a menu of all the dashes will pop up. On Windows, you can do what people have been doing on PCs since {{% link copy-v86-windows-1 %}}1985{{% /link %}}: Hold the Alt key and type either 0151 (for em dash) or 0150 (for en dash) on the numeric keypad.{{% margin-note side %}}These are the decimal representations of the dash characters in the {{% link wiki-windows-1252 /%}} character set. The leading zero differentiates each code from those using the legacy {{% link wiki-code-page-437 %}}CP437{{% /link %}} encoding, an equally curs&egrave;d artifact of backwards compatibility dating back to the original IBM PC from 1981.{{% /margin-note %}} And for Android users... well... quite honestly, I don't really care enough to go hunt that information down right now. Sometimes you have to figure your own stuff out.

In a whole bunch of apps, you don't even need to learn any special keyboard sorcery to achieve this---these programs can produce the intended dash while you are typing. Google Docs converts instances of two or three consecutive hyphens to en or em dashes, respectively. Microsoft Word has done something vaguely similar since as far back as the Office 95 days.{{% margin-note side %}}In Word 7.0, two dashes with surrounding spaces produced an en dash, while two dashes without spaces made an em dash. "AutoFormat As You Type" was weird. Actually it still is; the version of Word that currently ships with Office 365 is exactly the same.{{% /margin-note %}} The markdown renderer for this very site supports two/three-hyphen dashes, and that's how I typed them in the source document. Even in a context where the automatic substitution doesn't happen\--\-like this\--\-it's still clear what the author was trying to do even though the medium didn't oblige.

This is not some unknowable arcane magic. It's been like this for _decades._ How do you think the freakin' em dashes got into the freakin' LLM corpus in the first place, Super Chief? Have you ever read an article in _The New Yorker_? I swear their contributors must be paid by the em dash, with a nice honorarium for each instance of a "_co&ouml;perate_&rdquo;-style diaeresis or an "_oh, my God_&rdquo;--ass comma.  All of these models slurped up entire civilizations' worth of text data---a fair bit of it quite well written---and those works trained it to use the punctuation equally well.

## You're gonna learn it and you're gonna like it.

The **em dash** (---) and the **en dash** (--) are distant relatives of the **hyphen** (-), the symbol right next to the zero key on the majority of computer keyboards. The **em**{{% margin-note side %}}Pronounced like the letter _M_.{{% /margin-note %}} is a typography unit that means essentially "a distance equal to the height of the font." The canonical em dash is exactly as wide as its font is tall; it occupies a square area on the page. The letter _M_ had a similarly square outline in some of the very first typesetting systems, which explains the name. The **en**{{% margin-note side %}}Unsurprisingly, pronounced like the letter _N_.{{% /margin-note %}} is exactly one-half of an em. A similar comparison to the historical width of the letter _N_ could be made, although it's tenuous.

These sizing rules aren't nearly as rigid today. This page's body font---{{% link lora-font /%}}---has <em>M</em>s that are ever-so-slightly narrower than one em. {{% margin-note %}}This font's slashes (/) look kinda goofy too. Can't win 'em all.{{% /margin-note %}} Its em dashes are smaller still---about &frac34; of a true em. Modern sensibilities are all about what flows well and looks pleasing rather than blind adherence to rules.

With that out of the way, here are the rules for using dashes that we will be blindly adhering to. The Wikipedia {{% link wiki-style-dashes %}}style manual{{% /link %}} has many examples, as well as {{% link wiki-hyphens-and-dashes %}}an entire page on hyphens and dashes{{% /link %}} in particular. {{% link jakubmarian-hyphen-minus-en-dash-and-em-dash %}}Jakub Marian{{% /link %}} has a quite good explanation as well.

### En dash

The en dash should be used between numbers that form a range, a distribution, or a score:

> We are seeking a candidate with 20--25 years of React experience.

> He did not mind the 80--20 split of the proceeds; he was just happy to be helping.

> Jay Peebles had been throwing a perfect 8--0 game in the sixth inning when his arm fell off.

The en dash also separates members of a partnership or conflict:

> It took another decade for proof of the Simon--Garfunkel conjecture to be discovered.

> Historians have estimated that trillions of lives were lost during these stages of the Coke--Pepsi conflict.

More pedantically (and less consistently) the en dash can take the place of a hyphen in constructions where it makes the word grouping clearer. These examples show some of the differences in these usages:

> He grew from a pajama-wearing troublemaker into a leather jacket--clad anarchist.

> The organization could be described as pre-revenue but post--giving a damn.

> You keep offering me Pop-Tarts as if you have forgotten my staunch anti--Pop-Tart position.

### Em dash

The em dash can be put into many different areas of text. It can take the place of parentheses, commas, or a colon:

> He climbed into his sleeping bag---perhaps the ugliest object in the county---and slept for two days.

> Jerry's touch was fleeting, ephemeral---like the flash of reverse lights on a car shifting from park to drive.

> Their kitchen table was stacked high with the usual accoutrements---cabbage, lottery tickets, aging rock stars, and spite.

Another handy use of the em dash is to indicate text that either trails off or is being interrupted. It can frequently replace the ellipsis (...):

> But if I've been here the whole time, then that means---

> She wants to---no, she's going to walk up to the seventeenth floor and say it.

> "The last time I asked if we could play LCD Soundsystem---" "LCD Soundsystem sucks, bro!"

### Hyphen

In almost all other cases, a hyphen is placed between words or numbers because they are conceptually part of the same thing. Things like e-bike, clear-cut, 555-1212, father-in-law... {{% margin-note %}}Succinctly: "man-eating hamster" is a gigantic and fearsome beast, "man eating hamster" is a restaurant patron you want to be seated far from.{{% /margin-note %}} The hyphen joins these components together because they can't be separated without making the meaning ambiguous or totally incorrect.

### Minus sign, figure dash, horizontal bar, etc.

There are lots of {{% link fileformat-punctuation-dash %}}dashes and dash-like symbols{{% /link %}} out there. A bunch of them are visually indistinguishable from the ones listed above, but have subtle presentation differences in terms of how they wrap over multiple lines or align themselves in columns of data. It's worth knowing that they exist, but I doubt most casual observers would be able to tell the difference between &minus;3 and -3 if they weren't right next to each other.

## Consequently, in today's fast-paced world, it is crucial to foster actionable insights.

Now, it's not just em dashes that get called out this way. {{% margin-note %}}It usually is, though. You know why? Because em dashes stand out visually. It's easy to scan over a paragraph and pick them up without actually parsing any of the words. The people who point them out haven't bothered to read the content. What else haven't they bothered to read?{{% /margin-note %}} There are different groups of eagle eyes who tune into different supposed "tells" that the content was AI-generated. Typically none of it is based around any kind of deep analysis; certain words and phrases are always viewed with automatic suspicion.

For example, sometimes you'll hear people claim that LLM-written content overuses words like _delve_, _elevate_, _pivotal_, and _tapestry_.{{% margin-note side %}}Aha! Indisputable proof that _both_ Rob Mee and Carole King have been AI the whole time!{{% /margin-note %}} It's enticing for our busy and overworked brains to have these handy shortcuts that we can use to quickly categorize information about the world we inhabit. Like if a person says things like _ascertain_, _evidentiary_, and {{% link youtube-particular-individual %}}_particular individual_{{% /link %}} they're probably a cop. If the product description on an Amazon page is framed in weird symbols and brackets like {{% small-caps %}}&#x2605;&#x2727;&#x27e6;new experience&#x27e7;&#x2727;&#x2605;{{% /small-caps %}} there's a pretty good chance of cadmium exposure if you put the item in your mouth.

Problem is, these "quick" and "easy" filters aren't always accurate. I'd personally be surprised if they performed better than a fair coin toss. Sometimes you run across a clear-as-day case like somebody leaving _"As a large language model trained by OpenAI..."_ in the final product, but those moments are few and far between. Perhaps there is some signal in the sheer nothingness expressed by all the messaging about our "[dynamically/rapidly/relentlessly] [changing/emerging/evolving/shifting] [atmosphere/environment/landscape/market/society]." But, once again, this phrasing is prevalent in LLM output because it was prevalent in the input. We may be staring into a deeply unflattering funhouse mirror of human language, but it's still fundamentally our own reflection staring back at us.

But let's not get ahead of ourselves. This technology is game-changing. Groundbreaking. Ever-evolving. It's not just about navigating the landscape of LLM transformation---one must also understand the unique implications and touchpoints at a granular level. Whilst it is true that Artificial Intelligence market trends are---in essence---uncharted waters, the adoption rate is unparalleled and its value proposition cannot be overstated.

**Here are some of the key takeaways to help navigate this landscape and embark on a journey to new heights:**
<div class="first emoji-hell">

- **Do:** Structure your content into sections delimited by headings! Additionally, ensure that all content is expressed in the form of a list using emoji for bullet points. The more closely it resembles a PowerPoint presentation that you nod off during, the better! :white_check_mark:
- **Don't:** If the target platform does not support text formatting, don't worry! Simply &#x1d5fa;&#x1d5f6;&#x1d600;&#x1d602;&#x1d600;&#x1d5f2; &#x1d61c;&#x1d62f;&#x1d62a;&#x1d624;&#x1d630;&#x1d625;&#x1d626; &#x1d48e;&#x1d482;&#x1d495;&#x1d489; &#x1d553;&#x1d55d;&#x1d560;&#x1d554;&#x1d55c;&#x1d564; until all your narcissistic dreams of thought leadership come true! :brain: <!-- If I ever need it again: ''.join(f'&#x{ord(i):x};' for i in s) -->
- **Do:** Get excited! Whatever the discussion topic is, make yourself sound really really enthused! Unsettlingly pumped! Chomping at the bit with turgid desire! There is no need to worry about seeming weird or somehow "off" in tone---nobody is reading anyway! :100:
- **Don't:** Sometimes do not use contractions! Lieutenant Commander Data usually doesn't, but we just did. Who is the android now, Doctor Soong?! :robot:
</div>

**Let's deep dive into the dynamic world of this disruptive innovation:**
<div class="second emoji-hell">

- **It's not just about saying something, it's about contrasting it with something else in the process!** If saying something is good, then saying an additional thing that is the complete opposite of that thing is even better! Not only will your reader know what it is, they will also learn what it is not. Antithesis: It isn't just a win-win, it's a can't-lose! :beers:
- **In a world filled with utterly unremarkable content, punch it up with a Don LaFontaine--style intro!** You know, the guy who did the voice-overs for all those big movie trailers.{{% margin-note side %}}Back when movie trailers _had_ voice-overs, instead of just {{% small-caps %}}BRAAAM{{%/ small-caps %}}.{{% /margin-note %}} It doesn't really matter that this is sort of a throwback to an advertising gimmick that was already becoming pass&eacute; twenty years ago. In a world where nobody is thinking, nobody is noticing! :bulb:
- **Evoke. Inspire. Electrify.** Short phrase. Punchy caption. Three times. This is a relatively new addition to the club, but it can be used effectively to pad out your word count and make sure people smash that "_...more_" link on your post. Transmit the vibe. Conjure a feeling. {{% link youtube-diner-wink %}}Triples is best.{{% /link %}} :icecream:
- **Reach the summit of your game by using plausible-sounding metaphors that crumble like a cloth dinner napkin under any kind of careful examination.** If you have ever wondered if your LLM just clapped some words together into some brand-spanking-fresh malaprop aphorism, look no further! :see_no_evil:
- **Don't forget to slather it in good old-fashioned sycophancy!** When in doubt, add some completely unnecessary ego-fluffing into the mix. If nothing else, it'll help keep the output token count up. That's got to count for something, right?{{% margin-note side %}}I mean, something besides the literal count of tokens.{{% /margin-note %}} Of all the words that come to mind when describing the behavior of an LLM, inobsequiousness ain't one of them! :innocent:
</div>

{{% margin-note %}}I just want to point out that I wrote all this stupid nonsense _by hand._{{% /margin-note %}} In conclusion, in a sea of emerging technologies and disruptive innovations there are some real hints that the content _may've_ been written by AI, but you might have to read some of it. Hope that helps, and thanks for the exciting question! :balloon::hamburger:

## It's the real shit, shit to make you feel shit.

This, then, leads us around to what is perhaps a more useful question: What are some signs that a piece of content was _not_ written by a language model?

Well, if the author seems to swear like a stevedore, that's certainly a useful data point.

Most of the popular foundation models have guardrails in place to prevent them from forming responses that might be viewed as objectionable, vulgar, obscene, vile, or not in keeping with the polished and sterile image that their corporate creators would like to project. The end result is that these models tend to not curse very well, even if directly prompted to. If you subscribe to the theory that swearing is an art form,{{% margin-note side %}}And why the hell wouldn't it be?{{% /margin-note %}} then _masterful_ profanity is even harder to eke out of these things.

But it's not just about swearing for swearing's sake; {{% margin-note %}}He's back on his antitheses again...{{% /margin-note %}} the degree and quality of the cussin' is a component of the author's _personal language._ See, each of us has a unique set of life experiences, different cultural norms, our own opinions and aesthetic values. No two people are going to look at the same thing and produce perfectly identical thoughts about it. While language might not always have sufficient expressive power to completely and precisely convey these thoughts (to speak nothing of a person's ability to wield the entire linguistic space), there are _a lot_ of ways an author can get an idea out. Some might go for academic language with ample citations, others might relate a story about something they personally experienced half a lifetime ago. One writer might need a palette of emoji to get the thought out, another might need a thesaurus. Some phrases are destined to be carved into the massive granite bases of statues, others are relegated to the toilet partitions in a convenience store restroom.

The language models' greatest feat is also their most significant drawback---by absorbing the personal voice from every piece of content they have ever encountered, they produce a whole bunch of nonspecific, generic, mean-reverting {{% link eevee-rise-of-whatever %}}Whatever{{% /link %}} that manages to say much but convey very little. All it can ever be is a circumlocution machine. It won't tell deeply embarrassing tales of its youth, wear its grudges on its sleeve, passionately hold an unpopular position, or tug at threads without knowing ahead of time what the other end might be attached to. It doesn't wander off onto interesting tangents that bring the reader along on a little shared journey of discovery. It has no discernible soul, no passion for its work, no real ability to justify the screen space it has filled up---let alone the time and attention the reader is now giving it. We can tell when it's genuine. God dammit, we can tell.

I truly believe that you, the human being reading this paragraph right now, can tell that I am a real person sharing a genuinely-held opinion. Maybe you agree with me and maybe you don't; frankly I'd like to believe I don't give a shit. Deep down though, I probably care a whole lot more than I am comfortable admitting. I wear this fa&ccedil;ade of aloofness like a suit of armor to protect me from the thought that maybe I'm wrong. Maybe what I think doesn't actually make sense, and I'm going through life carrying some indefensible contradiction that an intelligent and introspective person would notice and correct. Why do I work so hard to avoid the comments on any discussion thread that forms around one of my articles? Perhaps I view criticism of my work as if it were criticism of _me_---my entire self---and maybe the thought of having to endure that experience terrifies me. What if I need to be right because being wrong means I have somehow failed at some aspect of my life? Is _failure_ the thing I've been so deeply afraid of all this time?

Or... I dunno, maybe just throw an {{% internal-link "projects/scottsmitelli.com" ai-pledge %}}AI pledge{{% /link %}} up instead. It's a lot easier.

## If nobody else jumped off a bridge, would you not?

Maybe AI took some punctuation marks, some words, some phrases. _Take 'em back._ There is no reason to shy away from using these features of our shared language out of fear that some chucklehead is going to fling an unfounded accusation about the text's provenance. If somebody pulls that, you have my full permission to send them here. {{% margin-note %}}They'll probably shriek and point at this article's em dashes as more evidence supporting their little AI chemtrail theories, but oh well.{{% /margin-note %}}

The fact of the matter is that an incomprehensible volume of generative AI output is being used by people who don't care about what they are producing and who and don't much respect the people who might (or might not) eventually consume it. We've all taken to calling the product of their---let's describe it as effort---"slop." A generation ago we were calling it "spam." As different as the underlying technologies are, the profile of the perpetrators hasn't changed all that much. They want something for nothing, and they get what they pay for. They're driven by a sickly mixture of self-serving greed and frankly embarrassing laziness. "I want _[thing]_, but achieving _[thing]_ is hard; somebody (or something) do it for me." I can respect a well-run grift, but Christ, put in the work.

Each of us has a particular way of looking at the world. With some degree of effort, our writing can convey that. Stated directly, the way to set yourself apart from an LLM is to say things that an LLM would not say. For me, it's phrases like "{{% internal-link ntp-what-times-are-it %}}protocol turducken{{% /internal-link %}}," "{{% internal-link fake-fixation %}}bosom euphemism{{% /internal-link %}}," "{{% internal-link dirty-disgusting-filthy-lice-ridden-boids %}}all-wings meetings{{% /internal-link %}}," and "{{% internal-link take-oncall-and-shove-it %}}ass{{% /internal-link %}}." To prove your output was produced without the assistance of a language model, the only thing you really need to do is write something that they cannot. For all the text they crank out every second of every day, turns out that there are a _whole hell of a lot_ of things that you just won't find in their output. All the fancy punctuation and five-dollar words in the world can't compensate for that.

If you find yourself with your finger hovering over the final keystroke necessary to type an em dash, or pausing to decide if you should backspace the occurrence of the word "elevate" that you just typed, ask yourself a simple question: _Is this my voice?_ There's a good chance it actually is, and in that case you should type what you were planning to type. Because if you don't, you're self-censoring. You're voluntarily surrendering the ability to express yourself in an authentic way. And for what? To avoid the possibility that an Internet Imbecile declares that your words were not your own? We all know that person is an ignorant jackass. Their words aren't important.

Yours are.
