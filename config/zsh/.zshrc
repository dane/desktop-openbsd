export XDG_CONFIG_HOME=~/.config
export XDG_CONFIG_DIRS=~/.config:$XDG_CONFIG_DIRS

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

export GOPATH=~/Projects
export GO111MODULE=on

export EDITOR=nvim
export KEYTIMEOUT=1

export GPG_TTY=$(tty)

autoload -U compinit; compinit
autoload edit-command-line

setopt NO_BEEP
setopt append_history
setopt share_history

bindkey '^Xe'   edit-command-line
bindkey '\e[A'  up-line-or-history
bindkey '\e[B'  down-line-or-history
bindkey '\e[C'  forward-char
bindkey '\e[D'  backward-char
bindkey '\eOA'  up-line-or-history
bindkey '\eOB'  down-line-or-history
bindkey '\eOC'  forward-char
bindkey '\eOD'  backward-char
bindkey -e
bindkey '^r' history-incremental-search-backward

alias uuidgen='ruby -rsecurerandom -e "print SecureRandom.uuid"'

path=(
  $GOPATH/bin
  $HOME/.local/bin
  $path
)

zle -N edit-command-line
prompt="%1~%%%  "
cdpath=$GOPATH/src

if [ -f ~/.local/zsh/zshrc ]; then
  source ~/.local/zsh/zshrc
fi

if [ -z "$TMUX" ]; then
  tmux list-sessions > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    tmux attach
  else
    tmux -f ~/.dotfiles/config/tmux/tmux.conf
  fi
fi
