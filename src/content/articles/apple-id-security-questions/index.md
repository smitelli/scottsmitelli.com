+++
title = 'To Apple ID or not to Apple ID, that is the security question.'
description = 'An absurd tale of my experience trying to reset the security questions on an Apple ID account.'
date = 2012-12-19
+++

In the late 90s, during my younger and wilder days, I made a pretty reckless mistake: I used the same password for every account I created online. It's shameful, I know. But I feel the need to admit it, and to atone for my sins.

As time marched on, password requirements became increasingly strict. I added a word or two for length, changed some of the vowels to digits when required, but the base password---the master key to my entire online presence---remained unchanged. I was using the same basic password _everywhere_.

A nagging voice in the back of my head had been saying "you better change your passwords" for years. I always ignored it, thinking my time would be better utilized doing, well, absolutely anything else. That changed abruptly in June of this year, when a little site called LinkedIn divulged some {{% link pcworld-2012-linkedin-breach %}}six and a half million password hashes{{% /link %}} during a data breach. I happened to have an account on LinkedIn, and the SHA-1 hash of my trusty, overworked password also happened to be present in the dump file. That was the kick in the pants I needed. I installed a {{% link keepass %}}password manager{{% /link %}}, and immediately changed the passwords on all my "important" accounts to random strings of letters, digits and symbols. No two sites could ever have the same password---that was my new rule.

After updating each of those accounts, I started trying to remember all the smaller and more infrequently-visited sites that I might have registered with. I've created hundreds of accounts during the decade and a half I've been active online, and there was just no way to find every single one. So I made a pact with myself: Every time I logged into a "dormant" account, I would immediately get rid of my old password and replace it with a new, secure one. Over the next few months, every time I found myself back on an old e-commerce site or the like, I would change my password.

I told you that story to tell you this one:

On Tuesday November 20th, I bought a new iPhone. It was my Thanksgiving present to myself. While configuring it to my liking, I was prompted for my Apple ID and password. Due to the way my old phone and iTunes remembered this password, this was the first time in several months that I had been prompted to actually type it in. And because of that, my password had never been changed from my old awful one. I figured the solution would be simple enough... Change the password online, give my new phone the new secure password, and everything would be just fine.

So began my week of hell.

The website you're supposed to visit to manage your Apple ID is {{% link apple-id true /%}}. I went there, logged in without any issue, and looked for something resembling a change password page. Ah, "Passwords and Security," perfect. I followed the link, and was then prompted to "Please answer [my] security questions." **Who was my favorite teacher**, and **what was my least favorite car?**

Who was my favorite teacher? Honestly, I'd forgotten the names of most of the teachers I've had. Of the ones I did remember, none of them really stood out as being worthy of a "favorite" label. My least favorite car? I didn't even remember answering that question. The car whose design offended me the most? _(Was the Pontiac Aztek popular when I originally answered these?)_ The least favorite car of all the cars I've owned? I've never actually owned a single car!

I shotgunned a few answers into the form, and they were rejected each time. There was no way to tell if one of the two questions was answered correctly, which roughly squared the number of attempts I had to make. Admittedly, it was a very effective security layer, in the sense that it prevented every single person---**even the rightful owner of the account**---from passing through. I finally admitted defeat, and started Googling for a workaround for forgotten Apple ID security question answers.

Some of the top results suggested I simply follow the link labeled "Forgot your answers? Send reset security info email to [email address]." As if it was that easy. My page didn't show that link because, as I later learned, I had never set a secondary "rescue" email address on my account.

I was stuck. While I had no problem at all logging into and using my account, I couldn't change my password because I couldn't remember the answers to my security questions. I couldn't reset my security questions because I didn't have a rescue email address. I couldn't set my rescue email address because I couldn't remember the answers to my security questions. It was an airtight loop.

There seemed to be one single option left: I could {{% link apple-support %}}contact Apple support {{% /link %}}. Guessing my way through the menu, I chose iTunes > iTunes Store > Account Management > "The topic is not listed." I typed in my tweet-length description of the problem and proceeded through the remainder of the form. I submitted everything by about 10pm Eastern Time.

At about 1:15am, I received an email response from a friendly fellow who informed me that there is a dedicated Account Security Team that handles problems like the one I was experiencing. In order to get my request to them, I'd have to redo my support request, but choose "Lost or forgotten Apple ID password" during the last step. Even though that wasn't specifically the issue I was experiencing, it was the only way to get my case heard by the Elite Account Security Task Force Action Team:tm:. This level of support would also require a phone call to be scheduled.

If your account management page flow involves a support call, you're doing something very, very wrong.

Apple has an interesting method for scheduling these calls. You enter your phone number then choose a day and a 15-minute time window when a support person can contact you. As it was rather late at night, the next available window was the following morning. I scheduled one for 8:00am the following day, and drifted off to sleep.

The next day, Wednesday November 21 at 8:01 on the dot, I received a call from Austin, TX. I cleared my throat, put my game face on, and answered the phone. It was a friendly robot, informing me that Apple was calling because of a support issue. It asked me if I would like to proceed, and I said yes.

The robot immediately came back to inform me that, due to the holiday, the call center was closed. It's sure nice of Apple to allow their support employees to have the day before Thanksgiving off. It would've also been nice if they **prevented me from scheduling a call** during a day when they knew nobody would be around to answer it. But hey, nobody's perfect, right? "Please try your call again tomorrow," the robot suggested. Somehow I felt like Thanksgiving Day was not going to be much different than today was.

I set the issue aside during the Thanksgiving break, and returned to the support site on Monday the 26th. I went through all the steps again, scheduled a call for 10:30pm the next day, and waited.

I received the call at 10:35, and a friendly human named Autumn actually did manage to solve my issue over the course of about five minutes. All my security questions were cleared, and I was prompted to recreate them the next time I logged into the Apple ID site. After the amount of trouble I went through, I made sure to create an entry in my password manager's database to hold the answers to my security questions. I also set up a rescue email address, which I'll hopefully never have to use.

In the days that followed, I learned that I could've visited {{% link apple-id-recovery true /%}} to quickly change my account password (but not my security questions). It would've been a good stopgap if my situation had been a legitimate emergency instead of a mild annoyance.

This whole experience left me with a really sour feeling towards Apple and the way they run their web services. First, they have the only site I've ever seen that requires you to answer security questions to perform an action _after_ successfully logging in. Most of the _banks_ I deal with don't even require that---they mainly pull out the security questions if you request a lost username/password email, or if you try to register an unfamiliar mobile device or the like.

Second, Apple really needs to update the text copy on the pages where these questions are created, emphasizing just how critical the answers are. I know for a fact that I've given quite a few B.S. answers to websites over the years, thinking that I'd never need to remember my responses unless I was dumb enough to forget my login credentials. If Apple had told me in big, bold letters that I would need these answers if I ever wanted to change my rescue email address and password, you better believe I would've put more care into selecting things I could remember.

Third, the list of questions to choose from is way too short, and all of the available options suck. Don't ask me about my spouse; I've never married. Don't ask me about foreign travel; I've barely even visited Canada. Don't ask me about pets, or cars, or favorite concerts. All of these things either flat-out don't apply to my life experiences, or apply to things that are so mundane and unremarkable to me that I will instantly forget what I chose and what thought processes led to that decision. You want to come up with memorable questions? Then abolish this cookie-cutter one-size-fits-all approach and replace it with a freeform text field so we can make up our own questions.

I know what the immediate response to that is going to be. You can't let users choose their own questions, because they'll just set it to something like "Type the word bacon?" with an answer of, you guessed it, "bacon." But you know what? If a user wants to be that stupid, just let them. Apple allowed me to be stupid by not warning me how important it was to remember the answers to my security questions. It's only fair that they grant the other side a similar liberty.

Oh, and fourth, why the hell would you close a call center that deals with issues that are this important to users? Why would you let me waste my time scheduling a call to an empty cubicle farm? Why do I trust my contacts, my notes, my iTunes purchase records, and **the ability to remotely wipe the entire contents of my phone** to a service whose account security team is unavailable _the day before_ a US-only holiday? I'm literally one account lockout from having to make an embarrassing 2006-style Facebook post telling all my acquaintances that I lost their contact info and to please re-send it. It's not a fun image to have in one's mind, and yet I can't seem to shake it. Apple likes to tout how everything "just works," but on those (admittedly few) occasions when it doesn't, it's a nightmare to sort out.

If I could leave you with a few nuggets of advice, they would go something like this: Don't lose the answers to your Apple ID security questions. Set up a rescue email address. And don't schedule an Apple customer support call for the day before Thanksgiving.
