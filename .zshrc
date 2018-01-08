export TERM="screen-256color"

export DEFAULT_USER=`whoami`

export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export WORKON_HOME=~/Envs

# Default editor
export EDITOR=vim

# Use MacVim's vim
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

# Open sourcetree
alias st='open -a SourceTree'

# clear
alias cl='clear'

# use ccat instead of cat
alias cat='ccat'

# use homebrew installed apps instead of system defaults
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# add postgres.app bin dir to path
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# add android utilities to path
export ANDROID_HOME=/Users/diegoallen/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

setopt HIST_IGNORE_DUPS
setopt  HIST_IGNORE_ALL_DUPS
HISTSIZE=100000
SAVEHIST=100000

# use gnu coreutils
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/man:$MANPATH"

# use gnu coreutils
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# use antigen to manage zsh plugins
source /Users/diegoallen/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle virtualenvwrapper
antigen bundle virtualenv
antigen bundle brew-cask
antigen bundle brew
antigen bundle colorize
antigen bundle django
antigen bundle httpie
antigen bundle vagrant
antigen bundle autojump
antigen bundle docker
antigen bundle docker-compose
antigen bundle zsh-users/zsh-syntax-highlighting

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv)

# Load the theme.
antigen theme bhilburn/powerlevel9k powerlevel9k

# Tell antigen that you're done.
antigen apply

# sets up proper alias commands when called
alias ls='ls --color'
alias ll='ls -hla'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.fastlane/bin/fastlane_lib:$PATH"
export PATH="$HOME/Applications/bin:$PATH"
