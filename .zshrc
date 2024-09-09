export TERM="screen-256color"

export DEFAULT_USER=`whoami`

# Default jditor
export EDITOR=vim

# set autosuggest buffer max size
typeset -g ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE='20'

# lvim as vim
alias vim='lvim'

# clear
alias cl='clear'

# use ccat instead of cat
alias cat='bat'

# Add user scripts in the home bin folder to the PATH
export PATH=$HOME/bin:$PATH

# use homebrew installed apps instead of system defaults
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# use hombebrew installed sqlite
export PATH="/usr/local/opt/sqlite/bin:$PATH"

# add postgres.app bin dir to path
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# add android utilities to path
export ANDROID_HOME=/Users/diegoallen/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# add docker binaries from the Docker.app to PATH
export PATH="$PATH:$HOME/.docker/bin"

setopt HIST_IGNORE_DUPS
setopt  HIST_IGNORE_ALL_DUPS
HISTSIZE=100000
SAVEHIST=100000

# use gnu coreutils
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/man:$MANPATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Add go bin path to PATH
export PATH="/Users/diegoallen/go/bin:$PATH"

# use antigen to manage zsh plugins
source /Users/diegoallen/src/dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle brew
antigen bundle colorize
antigen bundle django
antigen bundle httpie
antigen bundle autojump
antigen bundle docker
antigen bundle zsh-users/zsh-syntax-highlighting

## Tell antigen that you're done.
antigen apply

# Initialize startship prompt
eval "$(starship init zsh)"

# Disable the virtualenv prompt since starship already shows the virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=1

# sets up proper alias commands when called
alias ls='ls --color'
alias ll='ls -hla'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# open chrome from cli
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/diegoallen/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# enable history-substring-search
# https://github.com/zsh-users/zsh-history-substring-search#
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# fd alias to include hidden files
alias fd='fd -IH'

# transform python's unittest output to dotted.module.path
# ERROR: test_create_opportunity_calls_analytics_with_opp_form_experiment_enabled (paladin.opportunity.tests.test_api_mutations.OpportunityMutationCreateTest) => ERROR: paladin.opportunity.tests.test_api_mutations.OpportunityMutationCreateTest.test_create_opportunity_calls_analytics_with_opp_form_experiment_enabled
# example: python manage.py test 2>&1 | pptest
alias pptest="sed -E 's/(FAIL|ERROR): ([a-z_]+) \(([a-zA-z\.]+)\)/\1: \3\.\2/'"

alias lg='lazygit'

# Activate mise
eval "$(/usr/local/bin/mise activate zsh)"

# Add ~/.local/bin to PATH
export PATH=$HOME/.local/bin:$PATH

# Avoid echoing command to output
DISABLE_AUTO_TITLE="true"
