export ZSH="$HOME/.oh-my-zsh"
export GITLAB_TOKEN=""

ZSH_THEME="awesomepanda"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias zshconfig="nano ~/.zshrc"
export EDITOR=vim

eval "$(direnv hook zsh)"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=245,underline"

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
$PATH"

___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"
if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then
  . "${___MY_VMOPTIONS_SHELL_FILE}"
fi

export LD_LIBRARY_PATH=/usr/local/openssl/lib:$LD_LIBRARY_PATH

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

bindkey '^I' expand-or-complete

if [[ $EUID -eq 0 ]]; then
  PROMPT='%F{red}➜%f %~ '
else
  PROMPT='%F{green}➜%f %~ '
fi
