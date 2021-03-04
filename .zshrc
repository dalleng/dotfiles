export TERM="screen-256color"

export DEFAULT_USER=`whoami`

# Default editor
export EDITOR=vim

# Use MacVim's vim
 alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

# set autosuggest buffer max size
typeset -g ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE='20'

# Open sourcetree
alias st='open -a SourceTree'

# clear
alias cl='clear'

# use ccat instead of cat
alias cat='bat'

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

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# use antigen to manage zsh plugins
source /Users/diegoallen/src/dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pyenv
antigen bundle pip
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
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv anaconda)

# Load the theme.
antigen theme bhilburn/powerlevel9k powerlevel9k

# Tell antigen that you're done.
antigen apply

# sets up proper alias commands when called
alias ls='ls --color'
alias ll='ls -hla'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# open chrome from cli
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# enable pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# set up node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/diegoallen/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# add conda to the system path
PATH="$PATH:/usr/local/anaconda3/bin"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

