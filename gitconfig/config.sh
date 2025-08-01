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


git config --global format.pretty "format:%C(yellow)%h%Creset -%C(red)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"
git config --global help.autocorrect 1
git config --global color.ui true
git config --global color.branch.current "yellow reverse"
git config --global color.branch.local yellow
git config --global color.branch.remote green
git config --global color.status.added yellow
git config --global color.status.changed green
git config --global color.status.untracked red
git config --global core.editor "vim"
git config --global core.ignorecase false
git config --global alias.tree "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
# Краткий статус
git config --global alias.st "status -sb"
# Последний коммит
git config --global alias.last "log -1 HEAD --stat"
# Быстрый коммит с сообщением
git config --global alias.cm "commit -m"
# Очистить untracked файлы
git config --global alias.cleanup "!git clean -fd && git reset --hard"
# Отменить последний коммит (но сохранить изменения)
git config --global alias.undo "reset --soft HEAD^"
# Просмотр изменений перед коммитом
git config --global alias.dc "diff --cached"
# Просмотр кто менял файл
git config --global alias.blame "blame -w -M -C"
# Слияние с fast-forward, если возможно
git config --global alias.ff "merge --ff-only"
# Перебазирование на основную ветку
git config --global alias.rb "!git fetch origin && git rebase origin/main"


# Ускорение работы с большими репозиториями
git config --global core.preloadindex true
git config --global core.fscache true
git config --global gc.auto 256

# Параллельная загрузка объектов
git config --global submodule.fetchJobs 4


echo "Successfully set up global git configuration."
