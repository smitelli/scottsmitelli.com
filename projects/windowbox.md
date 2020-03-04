**Windowbox** is a simple photo-hosting website where I post pictures directly from my phone. I started doing this after graduating from high school in the summer of 2004, posting pictures from my LG camera phone to a self-hosted piece of PHP software called [EasyMoblog](http://www.easymoblog.org/) (later [CoMoblog](https://sourceforge.net/projects/comoblog/)). These projects were fine, but nobody was maintaining them and they were beginning to show their age. Rather than continue trying to hack new features onto my own fork, I started something new.

Windowbox started as a PHP app that I soon abandoned in favor of Python 2/Flask/SQLAlchemy. I had never used Flask or SQLAlchemy for anything prior to this, but I rapidly started to appreciate everything the frameworks did for me. It was rewritten once more using Python 3, and that's the version that runs today.

From a day-to-day perspective, Windowbox works by periodically checking a dedicated IMAP mailbox for new emails. Whenever it finds a new message and verifies it came from me, it posts the image attachment(s) to the site and sends an update to Twitter on my behalf. On my phone, all I have to do is compose an email to Windowbox's contact, attach my picture, and send. The Windowbox app takes care of thumbnail generation, RSS/Atom feeds, and syndication to Twitter.

Windowbox also exposes a read-only JSON API for anybody who cares to build a client to interact with it. (Note to anybody who does this: Share whatever you come up with; I'm curious!)

Requests to the site reach an nginx server, which directly serves static files and previously-built derivative files via the `X-Accel-Redirect` mechanism. Dynamic pages are proxied to uWSGI, which runs the Windowbox code. Database storage uses MySQL (actually MariaDB these days) and the resized/cropped image files are stored on disk. ExifTool is used to extract metadata from the source images.

The development environment runs in Vagrant, so things work more or less the same no matter what host operating system is running. Windowbox is also my first attempt at reaching 100% test coverage in a complete web app. It's not something I think I would generally recommend anybody try in their daily work, but it's not too difficult to live with since the project's development is relatively dormant today.

One of the things I take pride in is the fact that I was able to migrate all of my old EasyMoblog/CoMoblog posts -- the earliest going back to June 2004 -- into Windowbox. It's an interesting nostalgia trip to click back and see what I was doing and seeing almost half a lifetime ago. Sure, some photos are embarrassing and others are so grainy and low-resolution that it's unclear what the subject of the picture actually was, but each post is a reminder of some small step I took on the journey from the person I was to the one I now am.

* **Original Release:** July 2014; re-released November 2019 using Python 3

* **Source Code:** <https://github.com/smitelli/windowbox>

* **Try It Out:** [Windowbox](https://pics.scottsmitelli.com/)
