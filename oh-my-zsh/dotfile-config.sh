# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
    fuzzy-funcs
)

source $ZSH/oh-my-zsh.sh

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
#pokemon-colorscripts --no-title -s -r #without fastfetch
#pokemon-colorscripts --no-title -s -r | fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5 --logo -

# fastfetch. Will be disabled if above colorscript was chosen to install
# fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc

# Set-up icons for files/directories in terminal using lsd
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# neovim takeover
export EDITOR=nvim
alias vim=nvim
alias v=nvim
alias nv=nvim
alias vi=nvim

# readonly vim -> ex: ps aux | vr
alias vr="nvim -R -M"

# add go bin to path
export PATH=$PATH:$(go env GOPATH)/bin

# prevent cargo build from destroying computer
export CARGO_BUILD_JOBS=20

# simpler ipython alias
alias py=ipython


alias tm='tmux attach || tmux'
alias src='clear && exec zsh'

alias dcu='docker compose build && docker compose down --remove-orphans && docker compose up -d && docker compose logs -f'

# Add gem to environment
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.4.0/bin"

# Add mason to environment path
export PATH="$PATH:$HOME/.local/share/nvim/mason/bin"

# Copy last command
alias copylast='fc -ln -1 | wl-copy'

# Source .env file
dot() {
  set -a
  local file="${1:-.env}"
  [ -f "$file" ] && source "$file"
  set +a
}

# Make a tmux popup that reloads when the input files from stdin change
twatch() {
  cat - | entr -r sh -c "tmux popup -C; tmux popup -w 95% -h 95% -d $(pwd) \"$1 2>&1\""
}

# Watch results of command based on input files given through stdin
vwatch() {
  cat - | entr -r sh -c "tmux popup -C; tmux popup -B -w 95% -h 95% -d \"$(pwd)\" -E \"$1 2>&1 | nvim -R -M\""
}

# Watch results of command and pipe into jqp
jwatch() {
  cat - | entr -r sh -c "tmux popup -C; tmux popup -w 95% -h 95% -d $(pwd) -EE \"$1 2>&1 | jqp\""
}

numsum() {
  local total=0
  for n in "$@"; do
    (( total += n ))
  done
  echo "$total"
}

source $HOME/.config/broot/launcher/bash/br

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zoxide init zsh)"
