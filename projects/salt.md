**Salt** is a configuration management tool designed to automate the setup of a system. Everything on this website and the server it runs on is done via Salt states, and every piece of my Salt configuration (with the exception of passwords and other sensitive key material) is completely open on GitHub.

The states for this website, for example, are in [this file](https://github.com/smitelli/salt/blob/master/states/website/scottsmitelli-com.sls).

The entire server is comprised of well over 300 states.

* **Source Code:** <https://github.com/smitelli/salt>
