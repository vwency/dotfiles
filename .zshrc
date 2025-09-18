if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
  git
  zsh-autosuggestions
  aws
  alias-finder
  argocd
  azure
  gh
  celery
  direnv
  docker
  docker-compose
  dotenv
  gpg-agent
  history
  history-substring-search
  kubectl
  node
  npm
  nvm
  python
  pyenv
  rust
  terraform
  vscode
  web-search
  yarn
  ssh-agent
)

[ -f ~/.zsh_exports ] && source ~/.zsh_exports
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases
[ -f ~/.zsh_history_opts ] && source ~/.zsh_history_opts
[ -f ~/.zsh_completion ] && source ~/.zsh_completion

source $ZSH/oh-my-zsh.sh

bindkey '^I' expand-or-complete
[[ ! -f ${ZDOTDIR:-$HOME}/.p10k.zsh ]] || source ${ZDOTDIR:-$HOME}/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
