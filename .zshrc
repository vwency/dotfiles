export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:~/.spoofdpi/bin
export GITLAB_TOKEN=""

ZSH_THEME="awesomepanda"


plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh


alias zshconfig="mate ~/.zshrc"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ls='eza'

export DOCKER_HOST="unix:///var/run/docker.sock"
export EDITOR=vim
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

bindkey '^I' expand-or-complete
