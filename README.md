dotfiles
==========

This repository contains my personal configuration files that can be shared across devices.  This relies on [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles) and rcup.  Please follow the instructions in the repo prior to continuing here.
dotfiles

Install
-------

Install [rcm](https://github.com/thoughtbot/rcm):

    brew install rcm

Clone onto your laptop:

    git clone git@github.com:lvauthrin/dotfiles.git ~/.dotfiles

Install the dotfiles:

    env RCRC=$HOME/.dotfiles/rcrc rcup -v

Usage
-----

Sync the repository content to your computer's home directory:

    rcup -v

Add a file to be managed:

    mkrc -v ~/.file-to-be-managed

Remove a file from being managed:

    rcdn -v file-to-be-managed
    rm file-to-be managed

See files that are currently managed:

    lsrc

>>>>>>> 7f7adf8 (Initial commit of dotfiles)
