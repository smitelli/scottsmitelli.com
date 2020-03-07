**Salt** is a configuration management tool designed to automate the setup and management of computer systems. Every single bit of software installation and configuration on this server is done via Salt **states**, and every piece of my Salt configuration (with the exception of passwords and other sensitive key material) is completely open on GitHub. The states for ScottSmitelli.com, for example, can be found in [this file](https://github.com/smitelli/salt/blob/master/states/website/scottsmitelli-com.sls).

The entire configuration of this server comprises well over 300 states. These states do everything, from installing and upgrading nginx and writing its configuration files, to cloning repositories from GitHub and setting up users and permissions. If a service is not running that should be, Salt will start it. If a service is running that should not be, Salt will kill it.

If somebody were to clone this repo, fill in their own secret keys and tweak the configuration to their liking, they could launch a clone of this server and all the sites and applications that run on it. And hey, you know what? More power to 'em.

I started playing with Salt around 2015. At that time, my server was cobbled together by hand and I really had no idea how to recreate its configuration if I needed to. It ran an unsupported non-LTS Ubuntu release and was no longer receiving updates. I pledged that the next time I rebuilt it, I would do so in a repeatable way. It took almost three years and a few false starts, but I finally got the server to a point where it could build itself using Salt alone. I moved to Debian Stretch, then Debian Buster, each time reinstalling from scratch with no intervention outside of Salt.

The states are not written as generically as they could be, so switching (for example) from Debian to RHEL/CentOS or another yum-based distribution would be a pretty significant undertaking, but that's not something I plan to do anytime soon.

* **Original Release:** March 2018

* **Source Code:** <https://github.com/smitelli/salt>
