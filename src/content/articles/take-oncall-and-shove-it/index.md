+++
title = 'Take This On-Call Rotation and Shove It'
description = 'TODO'
date = 2025-03-03
+++

{{% epigraph %}}
> Everything fails all the time.
> <footer>Werner Vogels</footer>
{{% /epigraph %}}

The familiar blue and gold intro graphic fills the screen every evening at six o'clock on the dot. The jabbing staccato string music conjures up vague secondhand memories of what a teletype machine might have sounded like. A high angle view of the studio floor with the large Lexan-clad desk in the middle, then a cross dissolve to a two shot of the anchors for this newscast. The music fades, each anchor introduces themselves, then they jump right into the top story. It's been this way for as long as anybody can remember. They've never failed to get this show on the air.

_They've never failed._

## Who you gonna call?

Producing any sort of live television show is a complex ballet. The studio's cameras and microphones route into video switchers and audio mixers, pre-taped packages come from the video server, field reporters are connected bidirectionally through a satellite link, and with a sprinkling of pizazz from the motion graphics machine, the final product is sent off to master control and ultimately to all the kitchens and family rooms around the city.

But there are ancilary systems outside of this direct pipeline. The studio lighting is quite important, as most professional broadcast cameras tend to produce underwhelming images under inadequate light. The teleprompters feeding the anchors their scripts are obviously important. The entire block of weather reporting uses an entirely separate system of graphics rendering equipment that must be linked through a chroma keyer to place the meterologist in front of the forecast images. And quite obviously, this equipment requires human operators.

Broadcast equipment is obscenely expensive, but it is also incredibly reliable. It is rare for things to outright fail, but anything can eventually wear out after enough daily wear and tear. If a camera fails, perhaps they can wheel the one from the sports desk over to cover this part of the broadcast. If the teleprompters fail, the anchors have a copy of the script at their desk that they can look down at. If one of the anchors calls out sick, they can sub in talent from the morning broadcast.

Each of these is an example of either a redundant backup system or spare capacity that can be reallocated if needed. The broadcast technically does not need any of these contingencies to function normally, but in cases where things go wrong it can mean the difference between success and failure.

Not everything can be made redundant. A failure in the power system for the lights will most likely plunge the entire studio into darkness, and that's no way to run a news program. Similarly, if the $50,000 video switcher dies, it's highly unlikely that they'll have a spare in the supply closet. To insure against every possible thing that could go wrong, they would have to build a second studio on a separate part of the city's electric grid, with redundant copies of all the equipment and broadcast content, along with a full crew of understudies ready to take over at a moment's notice. These are things that can't reasonably be duplicated by any budget-conscious station.

There is a hybrid between the two options, allowing the station to only maintain a single instance of anything expensive while having some assurance that the equipment they have will work when needed: They can hire an Expert of some sort who is capable of fixing anything that breaks well enough to get the broadcast out. If the microphone battery dies, the Expert will fix it. If the video server acts up, the Expert will get it working again. If the tire pressure light in the Chevrolet Weather Beast comes on, or the studio's air conditioning fails, or the technical director breaks both their hands and needs somebody to push buttons for them, it's Expert time.

Now, naturally, most of the time everything is going fine and the Expert has nothing to do. So the Expert has some other regular job to do, say running the audio mixer. In fact, the audio mixer thing is their official job title and their primary responsibility at the station; they only become an Expert when something is wrong. As soon as the problem is resolved, it's back to the audio mixer.

The other thing about all this is, well, it's very difficult to find and train people to be Experts. And since this person is already the Expert for the 6:00 broadcast, why not also have them stick around for the 7:00 news, and 11:00? They're already at the studio anyway. And if anything happens during the 4:30-7am news, they can call the Expert at home and have them bop over and fix the problem. Also the news at noon, and the 4pm block. {{% margin-note %}}Apparently this station broadcasts six hours of live news programming most days. At least it's only four hours on Sunday.{{% /margin-note %}} In the station's view, there is only need for a single Expert because---most of the time---they never need an Expert at all. There should be no need to hire and train additional Experts because they barely use the services of the one they already have.

There is, of course, a third option that the station has never seriously entertained: Don't have an Expert at all, and if things really go to hell they can throw in an old _The Price Is Right_ rerun and hope for better luck during the next scheduled newscast.

---

- 6:00 nightly news
    - many facets to getting it on the air
    - problem?
        - build a redundant system with duplicates and understudies, perhaps a whole parallel universe
        - say "oh well," pop in a family feud tape, try again tomorrow
        - third option: find some superhero who can fix whatever comes up
    - wide range of responsibilities
        - resuscitate the anchors
        - fix the tire pressure in the weather beast
        - also, you cover every news broadcast all day
- what is a pager?
    - gather round kids, let me tell you about the good old days
    - hospital workers and building supervisors
    - key component, there used to be a human generating the requests
    - now it's all automated check-failing and graph-evaluating
- on-call in US-based big tech
    - expected to be around to respond in X minutes, 10-30 seems common
    - usually one week out of N, N=team size
    - sometimes there's escalation -- somebody turns their phone off to see Oppenheimer
        - don't let it get to your boss
    - not paid. they figure your salary is high enough to justify it
    - frequently no formal consideration for off-hours work. you get comp time? do you also have sprint load reduced?
    - they don't even give you a phone
    - varies considerably
        - oh, i was only on call like twice over the last quarter, and i never got paged. tee hee.
        - how very good for you. i was on-call every other week for most of a summer and was sometimes paged a dozen times daily.
        - runbook quality can really make or break it
        - sometimes they make an effort to fix the issue, but more often than not this is just internalized tech debt that has to be absorbed somewhere, so it goes to you.
        - it always seems to be the systems running on the thinnest margins that break. which is approximately everything.
- it blows
    - can't travel, drink, unplug. can't cut the grass because it takes too long to put the mower away.
    - need computer and internet. it's unpleasant to carry, unwise to keep in vehicle in some areas
    - maybe just stay home
    - fires at miserable times. movie night, dinner, sleep
        - wakes up significant other
        - it's dark, you're still asleep, you're alone. is this really the right headspace to be fixing stuff
        - can't go back to sleep due to light
    - after a while just the weight of "maybe" really interferes with life
    - i actually started hating my phone (maybe a good thing). that notification gave me PTSD
    - sometimes the issue can't be fixed
        - the more the org farms out to third parties, the more bizzare and unpredictable (and unfixable) the problems become
        - hurricane sandy is bearing down and the fuel pumps at 33 whitehall flooded
        - us-east-1 fails
- we need to talk about kafka
    - named in hilariously unintentional irony (insane worlds, destroyed 90% of writes, died leaving substantial work unfinished)
    - everybody wants it, nobody wants to run it, ends up falling to us
    - nobody has ever adequately described the reason for it
- alternatives
    - is this actually important?
        - maybe just don't freakin' do it. ever try redlining a contract? it's a negotiation!
        - passive customers have a surprising tolerance; goodwill seems to be a myth
        - do you actually have contracts or SLAs?
        - if you're not on-call, you're not doing anything important!
        - find your impostor syndrome. if this was important, why would they trust me with it?
    - multiple teams, follow the sun
        - what about weekends and holidays? maybe don't do it
    - make it voluntary. nobody will want to do it. so entice them to want to do it.
    - pay for the time
    - pay for incident responses
        - don't say the stupidest thing i've ever heard: this encourages sabotage and fraud
    - again, is it important?
- never again
    - don't you think you should be responsible for your code?
        - what "your code?" isn't the whole idea that this is a team? it's "our code." or, more healthy: "the code."
    - people are different. they are in different walks of life with different responsibilities
    - when i asked if this is important, i bet you answered from the company's perspective. i'm asking you now -- is this important _to you?_
    - 5,000 weeks if you're lucky
    - just shy of 2k, meant what i said. i have been paged enough
