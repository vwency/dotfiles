# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:~/.spoofdpi/bin
export GITLAB_TOKEN=""

ZSH_THEME="powerlevel10k/powerlevel10k"


plugins=(git zsh-autosuggestions aws alias-finder argocd azure celery direnv docker docker-compose dotenv gpg-agent history history-substring-search kubectl node npm nvm python pyenv rust terraform vscode web-search yarn)

source $ZSH/oh-my-zsh.sh


alias zshconfig="mate ~/.zshrc"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'


alias k='kubectl'
alias kg='kubectl get'
alias kd='kubectl describe'
alias kdel='kubectl delete'
alias kl='kubectl logs -f'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgd='kubectl get deployments'
alias kns='kubectl config set-context --current --namespace'
alias kctx='kubectl config use-context'

alias gst='git status -sb'
alias glog='git log --oneline --graph --decorate --all'
alias gcom='git checkout main || git checkout master'
alias gcod='git checkout develop'
alias gpo='git push origin'
alias gpom='git push origin main || git push origin master'
alias grh='git reset --hard'
alias grs='git reset --soft'
alias gcane='git commit --amend --no-edit'
alias gwip='git add -A && git commit -m "WIP"'
alias gunwip='git log -n 1 | grep -q -c "WIP" && git reset HEAD~1'


alias dps='docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"'
alias dpsa='docker ps -a --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"'
alias dimg='docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}"'
alias dstop='docker stop $(docker ps -q)'
alias dclean='docker system prune -f'
alias dlog='docker logs -f'
alias dexec='docker exec -it'

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt CORRECT
setopt CORRECT_ALL
setopt PROMPT_SUBST


export DOCKER_HOST="unix:///var/run/docker.sock"
export EDITOR=vim
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=100
eval "$(direnv hook zsh)"


ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=245,underline"

# ЕДИНСТВЕННЫЙ блок настройки PATH
export PATH="\
/usr/local/openssl/bin:\
/usr/local/sbin:\
/usr/local/bin:\
/usr/sbin:\
/usr/bin:\
/sbin:\
/bin:\
/usr/games:\
/usr/local/games:\
/snap/bin:\
$HOME/protoc/bin:\
$HOME/.local/bin:\
/opt/istio-1.25.0/bin:\
$(go env GOPATH)/bin:\
${PNPM_HOME}:\
$PATH"

___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi

export LD_LIBRARY_PATH=/usr/local/openssl/lib:$LD_LIBRARY_PATH

# pnpm
export PNPM_HOME="/home/wency/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
alias sn='nix develop --extra-experimental-features "nix-command flakes"'


# Enable command completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes


zstyle ':omz:plugins:alias-finder' autoload yes # disabled by default
zstyle ':omz:plugins:alias-finder' longer yes # disabled by default
zstyle ':omz:plugins:alias-finder' exact yes # disabled by default
zstyle ':omz:plugins:alias-finder' cheaper yes

bindkey '^I' expand-or-complete

echo "🚀 Terminal ready!"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
