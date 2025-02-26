+++
title = 'On-Call Blows'
description = 'TODO'
date = 2025-02-26
+++

{{% epigraph %}}
> Everything fails all the time.
> <footer>Werner Vogels</footer>
{{% /epigraph %}}

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
        - it always seems to be the systems running on the thinnest margins that break. which is approximately everything.
- it blows
    - can't travel, drink, unplug. can't cut the grass because it takes too long to put the mower away.
    - need computer and internet. it's unpleasant to carry, unwise to keep in vehicle in some areas
    - maybe just stay home
    - fires at miserable times. movie night, dinner, sleep
        - it's dark, you're still asleep, you're alone. is this really the right headspace to be fixing stuff
    - after a while just the weight of "maybe" really interferes with life
    - i actually started hating my phone (maybe a good thing). that notification gave me PTSD
    - sometimes the issue can't be fixed
        - hurricane sandy is bearing down and the fuel pumps at 33 whitehall flooded
        - us-east-1 fails
- we need to talk about kafka
    - named in hilariously unintentional irony (insane worlds, destroyed 90% of writes, died leaving substantial work unfinished)
    - everybody wants it, nobody wants to run it, ends up falling to us
    - nobody has ever adequately described the reason for it
- alternatives
    - is this actually important?
        - maybe just don't freakin' do it
        - passive customers have a surprising tolerance; goodwill seems to be a myth
        - do you actually have contracts or SLAs?
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
