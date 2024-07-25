+++
title = 'Scottfiles'
description = "Scott's dotfiles."
date = 2015-08-01
fuzzyDates = 'ym'

[[infoBox]]
key = 'Source Code'
value = '{{% link scottfiles-source true /%}}'
+++

**Scottfiles** are Scott's dotfiles. I generally try not to go crazy with the visual tweaks, aliases, or keyboard mappings, mainly because I often have to jump onto unfamiliar servers or freshly-created VMs where these customizations may not be installed. I don't want my muscles to forget how to use a vanilla Linux installation.

I move through a veritable sm&ouml;rg&aring;sbord of Linux, OS X, and Cygwin environments, and this tends to provoke some interesting cross-platform inconsistencies that I need to paper over. My dotfiles are designed around the {{% link stow /%}} installation scheme which allows groups of files to be selectively installed on some systems but not others. This, paired with generous use of `*.d/` directories, allows for something approximating a dotfile plugin architecture.

The main entrypoint, if you will, is the custom `.bashrc` file. This sources everything in the `${HOME}/.bashrc.d` directory, which is where most of the other packages register their own entrypoints. Other files (`.gitconfig`, for example) are symlinked straight into the location where the corresponding tool expects each file to be.

Storing dotfiles in a Git repo, regardless of the way they ultimately get installed, has been one of the better organizational decisions I've made. I no longer have disparities between different environments because I forgot to carry a config file tweak from one machine to another.

And above all: I believe that the more people I can share Stow with, the better. Seriously, go give it a try. See if there's someplace in your life where it can fit.
