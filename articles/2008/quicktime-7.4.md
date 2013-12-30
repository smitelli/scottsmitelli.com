If you don't want to read my rambling, you can [jump straight to the downgrade instructions](#fix-instructions).

**Edit:** The new QuickTime 7.4.1 update fixes this entire issue. If you have 7.4 and are experiencing After Effects problems, upgrading to 7.4.1 should give the same results as this procedure.

There's been something of a fervor on the ol' Interblogotubes about a QuickTime update that Apple pushed out to us last week. The casual user probably doesn't know or care, but creative professionals have undoubtedly noticed that [QuickTime 7.4 completely breaks Adobe After Effects' ability to export .mov files](http://www.tuaw.com/2008/01/23/after-effects-7-users-quicktime-7-4-update-a-nono/). Which, to say the least, is kind of a big deal.

The steps to reproduce the problem are simple. On any OS X machine with QuickTime 7.4 installed, try to render something in After Effects. Something rather big, it needs to run for 10 minutes. After exactly 10 minutes, it'll stop with an error that reads, "After Effects error opening movie - you do not have permission to open this file. (-54) (44::53)." Every time, and always after 10 minutes.

The problem definitely comes from installing QuickTime 7.4. Multiple sources (myself included) have verified that everything is peachy with QuickTime 7.3.1 (the previous version I remember using), and everything goes to hell once 7.4 comes. It appeared as an innocent software update, and being the complacent update-zombies we are, we installed it. And now we regret it.

The community has come up with a few so-called "fixes," most of which are hardly worth the name. Some say to set After Effects to render an image sequence, where each frame is written to a separate image file instead of one video file. But then you're stuck with 9,000 TIFF files instead of that 5-minute movie file you wanted. Clearly that's not an ideal solution.

Others claim the "right" thing to do is perform an "Archive and Install" of their operating system. For those of you unfamiliar with the Mac lexicon, Archive and Install is a nice way of saying "copy all your files and settings to another drive, wipe the system drive, reinstall the OS fresh, and move all your crap back." That'll certainly get rid of QuickTime 7.4. It'll also do a terrific job wasting an afternoon. Reinstalling your entire OS seems like a very Windows thing to do. Certainly not the type of thing you'd expect from a company where everything supposedly "just works."

I hear you asking why we all don't just uninstall QuickTime, or go back to a version that works... That's where the problem lies: QuickTime is rooted deep in the bowels of OS X. Everything relies on it for video/audio support, from iTunes to Final Cut Pro. You can't just get rid of it without breaking things a whole lot more. Which leave us with the downgrade option. After clicking around Apple's site for a while, I eventually found a page where you can download the old 7.3.1 version for [Tiger](http://www.apple.com/support/downloads/quicktime731fortiger.html), [Leopard](http://www.apple.com/support/downloads/quicktime731forleopard.html) and... [Panther](http://www.apple.com/support/downloads/quicktime731forpanther.html)?! Wow.

Alright, download it, install, and we're back in business. Right? Wrong. A few clicks in, the installer points out that a newer QuickTime version is already installed, and you obviously don't want this old, inferior version. Grrr.

A sane man would've just settled for rendering image sequences, or maybe reinstalling his OS. A sane man might've even Googled for any new solutions the community may have cobbled together. But nobody's ever accused me of being sane.  I took it upon myself to tear into the QuickTime 7.3.1 installer and figure out exactly what was keeping it from installing. I figured that since the system was already sorta broken, I may as well use the opportunity to throw caution to the wind and break it some more. Not like I had anything to lose.

The installer file that comes from Apple's website is a .dmg file - a disk image. It contains an entire filesystem, just like a hard drive, CD/DVD, or a Flash memory card. When you open it, the OS mounts it as if it were a drive you just plugged in. You can then open it, navigate around, and access whatever files it holds. Most of the time, the only difference you notice is the fact that the .dmg has no free space on it and you can't easily change its contents.

Inside the disk image is one file: QuickTime731\_Tiger.pkg. (Yes, I'm still using Tiger. Deal with it.) Double-clicking that file starts the installation procedure, which ultimately fails and gets us nowhere.

An interesting thing about .pkg files (and a lot of files in OS X) is that they're not actually files at all. As far as the underlying OS is concerned, it's simply a folder whose name ends in ".pkg" - try it. Make a new folder somewhere, and add .pkg to the end of its name. Finder will ask if you want to add the extension; tell it yes. Boom, the icon changes from a folder to an Installer package. And double-clicking it will no longer show the contents of the folder, but instead it will start the Installer program and pop up a friendly error stating the package doesn't work.

So what's in the QuickTime installer package? Well, right-click it and choose "Show Package Contents" and you'll see. There's a single solitary folder called Contents. And inside that? Aha! That's where the real meat of the installer is. There are .plist files, a .pax.gz file which contains all the actual files that the installer copies, and some various odds and ends that tell the installer what it'll actually be installing.

I won't go through the painful details of what I found in each file, because most of it is boring and of no real consequence. Plus if you cared, I'm sure you'd go off on your own and discover it for yourself. After a bit of poking, hex viewing, and a few trips to `strings` on the command line, I stumbled on a veritable goldmine. Inside QuickTime\_Tiger.dist, which is a simple text file containing mostly XML, there's a script which seemed to hold all the answers. Specifically, the following function:

<pre class="brush: js">
function newerQuickTimePresent()
{
    var path = my.target.mountpoint + "/System/Library/Frameworks/QuickTime.framework";
    var bundle = system.files.bundleAtPath(path);
    var version = BundleGetCompositeVersion5(bundle);
    if (version &amp;amp;&amp;amp; (system.compareVersions(version, "7.3.1.999999999.999999999") &amp;lt; 1)) {
        return false;
    }
    return true;
}
</pre>

*(Yes, the script actually has XML character entities like that. This is not a display error with my blog.)*

I can venture a pretty good guess what that does. If the version of QuickTime already on the machine is older than the highest version of 7.3.1 they would ever release, the function says `false`. If the version of QuickTime on the machine is newer than that (such as 7.4), the function says `true`. Could it be that simple? I changed the last line in the block to return false, saved the file and tried to install. And to my great relief, it no longer blocked me from downgrading. I happily clicked through the remainder of the installer. It couldn't be that easy, could it?

On the "writing files" phase of the installation, it got to about 3%, then the progress bar jumped to the end. The installer claimed it was finished and it needed to restart. That struck me as a bit odd; it should've taken a little longer than that, and it should've spent some time "Optimizing System Performance" when it was done, right? But I restarted anyway, and hoped for the best.

No dice. After the system came back up, a glance at QuickTime told me that 7.4 was still there. But at least I was no worse off. For some reason, something deeper in the installer knew that a newer version of QuickTime was already installed, and it silently skipped the installation of each individual component. But how does it know?

I looked in the Resources folder for answers. There's a lot more in there, but a lot of the files are just `perl` and `sh` scripts to delete old files that are no longer needed. And there's localization stuff that tells the installer what to say in about 18 different languages. (Did you know that "This software requires Mac OS X version 10.4.9" translated to Italian is "Questo software richiede Mac OS X versione 10.4.9?" Wonders never cease.)

As I browsed, I saw a file called BundleVersions.plist. (A .plist file is a Property List, which is basically a file that stores things like preferences. Any program that remembers, for example, "the last color you used was blue" might store that information in a .plist file somewhere. You could say they're similar to .ini files on Windows.) And what was inside this particular file? 58 key/value pairs, each one matching the name of one of the components in the installer's .pax.gz archive. Each component had a version number in this file. So that's how it must work... As the installer goes down and installs each component, it first reads the version number out of the .plist file and compares it to the version on the disk already. If the version in the installer package is older, it skips over it and goes on to the next component. Since everything in the 7.3.1 package was older than the 7.4 stuff on the drive already, everything was skipped over. That's why it "installed" so quickly; it had nothing to actually do!

Unfortunately, not every one of the 58 components was numbered 7.3.1. AudioCodecs was 1.5, CoreMediaAuthoring was 1.1, CoreVideo was 1.4.2... It wasn't like I could just go through this file and forge all the version numbers to be higher than the 7.4 components on the drive. That would've taken forever, and who knows what it'd end up breaking in the long run.

It was then that I got a lazier idea: why not just delete the entire .plist file? One of two things could happen... Either the installer will notice the file's not there, freak out and stop... Or it'll press on regardless, and assume that everything in the installer package is newer than whatever's installed on the drive. A common mantra among software people is to "be conservative in what you send, and **liberal in what you accept**." If Apple's developers truly followed this, then they'd design the Installer program to gracefully deal with a missing file and continue as best it can.

So I deleted it. And I ran the installer. And I gritted my teeth.

And it worked.

The installer ran flawlessly, as far as I could tell. It spent a reasonable time writing the files, it Optimized System Performance, and it asked me to reboot. I allowed it, and once it came back up I was the proud owner of QuickTime 7.3.1 again. Software Update even popped up asking if I wanted to install 7.4. **No I don't!**

I went back into After Effects to run off a test render, and it worked perfectly. No side effects at all, from what I could see. I beat the system.

<span id="fix-instructions">So to recap, here are the steps you need to do to play along at home.</span>

**1. Delete all files named QuickTime*XXX*\_*BigCat*.pkg (where *XXX* is a version number and *BigCat* is your OS name) from your /Library/Receipts folder.** Your Receipts folder stores a copy of every installer package you've ever put on the system, but without the files that went into your Applications folder, etc. It's used by Disk Utility to repair permissions on files, and maybe some other stuff. Point is, you don't want these old versions lying around waiting to gum things up.

**2. Download the QuickTime 7.3.1 disk image for your OS from Apple's website ([Leopard](http://www.apple.com/support/downloads/quicktime731forleopard.html)/[Tiger](http://www.apple.com/support/downloads/quicktime731fortiger.html)).** Edit: Although there is a [Panther](http://www.apple.com/support/downloads/quicktime731forpanther.html) version of the QuickTime installer available, the internal structure of the package is completely different and this procedure WILL NOT WORK on that version. Sorry. (Tiger came out almost three years ago. C'mon, guys. :-D)

**3. Mount the disk image and open it. Copy the package file out of the disk image onto your Desktop or similar location.** We need to change the contents of this package, and we can't do that on a read-only disk image. You could also unmount the disk image at this point, if it would somehow make you feel better to be sure you were hacking on a copy and not the original.

**4. Right-click the package on your Desktop and choose "Show Package Contents." Open the "Contents" folder inside.**

**5. Find the file called "QuickTime\_*BigCat*.dist" (where *BigCat* is your OS name). Right-click, "Open With" > "Other..." and choose TextEdit to open the file.** It's a plain ol' text file, even though it may not look like one.

**6. Find the following block of text:**

<pre class="brush: js">
function newerQuickTimePresent()
{
    var path = my.target.mountpoint + "/System/Library/Frameworks/QuickTime.framework";
    var bundle = system.files.bundleAtPath(path);
    var version = BundleGetCompositeVersion5(bundle);
    if (version &amp;amp;&amp;amp; (system.compareVersions(version, "7.3.1.999999999.999999999") &amp;lt; 1)) {
        return false;
    }
    return true;
}
</pre>

Don't worry, you don't need to understand what it does. You just need to find it. It's about 2/3 of the way down. You could do a Find (Command+F) and look for the phrase **function newer** - the first result should be this block. **On the very last line of this block, directly above the }, change the word `true`  to `false`.** In simpler terms:

`return true;`

should become

`return false;`

...and don't forget that semicolon! :-D

**7. Save the file and quit TextEdit.**

**8. You should be back at the "Contents" folder. Open the "Resources" folder and look for a file named BundleVersions.plist. Go right ahead and drag that sucker to the Trash.**

**9. Theoretically, that should do it. Double-click the altered package on your Desktop, and it should allow you to install without any complaints.** After you restart, QuickTime 7.3.1 should be back in all its glory. And eventually Software Update will bug you to install 7.4 again. You probably know better by now.

And of course, the standard disclaimer: I make no guarantee that this will work properly for you. I can't guarantee you won't hose your system. If this procedure causes any problems whatsoever, it's not my fault. But having said that, I've done this several times on my own machine and nothing bad has come from it. All these operations are relatively safe - most of what you're messing with is a *copy* of something you just *downloaded* from Apple's site. But always back up your data and important files, and do this at your own risk.

Also, before I get a comment from some Mac zealot, yes I know about [Pacifist](http://www.charlessoft.com/) and the fact that it's designed to force-install packages like this without the need to manually dig through the installer's slimy innards. Quite simply, I didn't want to install an entire program for something I'd probably only need to do once in the lifetime of this machine. And I also wanted to figure this out on my own, as sort of an intellectual challenge. (And truth be told, I think my method's a little faster than the Pacifist way, especially if you have to do it on several computers. The "altered" package can be burned onto a CD, where it should go from computer to computer very quickly.)

The facts end here. Now we begin the speculation. After messing with both the 7.3.1 and 7.4 versions of QuickTime, I've come up with a few conclusions.

* With both versions, videos play and export from within QuickTime perfectly.
* With both versions, none of the Final Cut Studio apps seem to misbehave. Note that I didn't check obscure filter/codec combinations, but still, nothing major jumped out.
* With 7.3.1, After Effects works fine.
* With 7.4, After Effects still works fine while editing. In fact, I can open any source footage and play it for hours with no errors. It seems to have no trouble playing existing files or jumping to random locations in the timeline.
* With 7.4, however, After Effects will always error out when it writes a new .mov file to the disk. And it always happens exactly 10 minutes after the render started. Never more than +/- 1 second away.

So what is it? Is it a QuickTime bug or an After Effects bug? Is it some kind of evil DRM monster rearing its ugly head? Honestly, I'd have to guess it's all three.

Apple recently announced that it's going to allow movie rentals through iTunes. iTunes uses QuickTime to play video. Therefore, QuickTime is responsible for making sure you're allowed to watch the rented movie you're trying to play. According to Apple's <del>[FAQ](http://docs.info.apple.com/article.html?artnum=307257)</del>, you have 24 hours to finish watching the movie from the minute you first hit play. So how would they manage something like that? Obviously they'd have to put some sort of timer into QuickTime that periodically checks to make sure that you're still allowed to be accessing the video. But how often should it check? **Every ten minutes?**

But many videos QuickTime handles have no DRM at all. Take, for example, a file you're exporting from Final Cut or After Effects. Those files would obviously have no protection. But how would QuickTime know the difference? Perhaps a **small bit of information at the beginning of the file?**

My theory is that QuickTime looks for something in each file that tells it "this file is not protected by DRM, so ease off" in every single file that it touches. I imagine that every non-purchased .mov file dating back to who-knows-when can be identified as such by QuickTime. I think that when Final Cut or another program goes to create a new .mov file, the first thing it does is lay down that ground rule so QuickTime's protection mechanisms will leave it alone.

If that's the case, then maybe After Effects writes the files wrong. Maybe it renders the whole file, then goes back and puts the "not protected" sticker on the file after it's finished. Maybe it always did, and it was never an issue. Problem is, QuickTime changed, and now After Effects' sloppy file-writing no longer works.

In a nutshell, I imagine that QuickTime changed to allow for more DRM. Apple didn't warn anybody that this might break programs that weren't written to their specifications. Adobe After Effects just happens to be one of those programs that weren't written to the specifications, and now the flaw jumps out. Is that fact? I have no idea. Is it possible? Certainly.

The fact that it always happens after exactly 10 minutes is incredibly suspicious. Ridiculously suspicious. That's no fluke, there's a 10-minute timer somewhere in QuickTime that keeps cutting After Effects off.

By the way, to those people who claim the error message is referring to a problem with the disk permissions, please, do us all a favor and SHUT THE HELL UP. You clearly don't know what you're talking about. If the After Effects process didn't have (Unix) permission to access one of the files in question, it wouldn't render anything at all. If it didn't have read access on the source footage, you wouldn't even see any video in the program at all. The fact that it renders for 10 minutes indicates that the read/write permissions are just fine. In fact, if you open up the output video, you can actually watch it up until the point where the render stopped, and it looks fine. If it were a Unix permission issue, it wouldn't have rendered squat.

I really don't think this is an intentional move by Apple to try to attack their competition (Adobe), contrary to what some conspiracy theorists might say. Apple can be evil, but I don't think they're *that* evil. I really think it's just an oversight that will be fixed eventually. Although I really don't know which company is going to have to alter their product to fix it. Judging by Apple's stubbornness when it comes to admitting flaws, combined with the fact that After Effects is the only program that really truly broke, I'm thinking Adobe's going to have to step up and fix this one. Until then, we wait, and ignore that nagging QuickTime 7.4 update.

It's my sincerest Christmas wish that this post is somehow illegal under the [DMCA](http://en.wikipedia.org/wiki/Digital_Millennium_Copyright_Act). A boy can dream.
