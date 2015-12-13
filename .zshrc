export TERM="xterm-256color"

export DEFAULT_USER=`whoami`

export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export WORKON_HOME=~/Envs

# use homebrew installed apps instead of system defaults
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# add postgres.app bin dir to path
export PATH=/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH

# add android utilities to path
export PATH=/Applications/Android\ Studio.app/sdk/platform-tools:$PATH
export PATH=/Users/diegoallen/Library/Android/sdk/build-tools:$PATH

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

# Add android tools
export PATH="$PATH:/Applications/Android Studio.app/sdk/platform-tools:/Applications/Android Studio.app/sdk/tools"
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

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv)

# Load the theme.
antigen theme bhilburn/powerlevel9k powerlevel9k

# Tell antigen that you're done.
antigen apply

# sets up proper alias commands when called
alias ls='ls --color'
alias ll='ls -hla'
