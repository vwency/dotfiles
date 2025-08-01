#!/bin/bash

if [ -f ~/.gitconfig ]; then
    cp ~/.gitconfig ~/.gitconfig.bak
    echo "Backup of ~/.gitconfig saved as ~/.gitconfig.bak"
fi

# Установка конфигурации с помощью git config
git config --global user.signingkey "C2056057916F84A327F73A57EF6DE6CB33EA2869"
git config --global user.name "vwency"
git config --global user.email "veniaminshp@gmail.com"

git config --global commit.gpgSign true
git config --global gpg.program "/usr/bin/gpg"
git config --global pull.rebase false
git config --global gui.pruneduringfetch true

git config --global smartgit.submodule.fetchalways false
git config --global smartgit.submodule.update true
git config --global smartgit.submodule.initializenew true

git config --global push.recurseSubmodules check

git config --global filter.lfs.clean "git-lfs clean -- %f"
git config --global filter.lfs.smudge "git-lfs smudge -- %f"
git config --global filter.lfs.process "git-lfs filter-process"
git config --global filter.lfs.required true

git config --global init.defaultBranch "main"
git config --global http.postBuffer 1048576000

git config --global alias.fm "fetch origin master"

git config --global credential.helper "cache"

echo "Successfully set up global git configuration."
