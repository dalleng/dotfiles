export TERM="screen-256color"
export HOMEBREW_PREFIX="$(brew --prefix)"

export DEFAULT_USER=`whoami`

# Default editor
export EDITOR=lvim

# set autosuggest buffer max size
typeset -g ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE='20'

# lvim as vim
alias vim='lvim'

# clear
alias cl='clear'

# use ccat instead of cat
alias cat='bat'

# include hidden files and files in .gitignore
alias rg='rg --hidden --no-ignore'

# Add user scripts in the home bin folder to the PATH
export PATH=$HOME/bin:$PATH

# use homebrew installed apps instead of system defaults
export PATH=$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$PATH

# use hombebrew installed sqlite
export PATH="$HOMEBREW_PREFIX/opt/sqlite/bin:$PATH"

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
PATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH="$HOMEBREW_PREFIX/man:$MANPATH"

### Added by the Heroku Toolbelt
export PATH="$HOMEBREW_PREFIX/heroku/bin:$PATH"

# Add go bin path to PATH
export PATH="/Users/diegoallen/go/bin:$PATH"

# use antigen to manage zsh plugins
source $HOMEBREW_PREFIX/share/antigen/antigen.zsh

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
# antigen bundle docker
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

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# open chrome from cli
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/diegoallen/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# enable history-substring-search
# https://github.com/zsh-users/zsh-history-substring-search#
source $HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh
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
[ -x /usr/local/bin/mise ] && eval "$(/usr/local/bin/mise activate zsh)"

# Add ~/.local/bin to PATH
export PATH=$HOME/.local/bin:$PATH

# Avoid echoing command to output
DISABLE_AUTO_TITLE="true"

# -R: Allows raw control characters (for color output).
# -X: Prevents clearing the screen after exiting less.
# --use-color: Ensures color support (if available). Useful for when you search with /<search_term>, default behavior is to use italics for matched terms which is awful.
export LESS='-RX --use-color'

# Added by Windsurf
export PATH="/Users/diegoallen/.codeium/windsurf/bin:$PATH"

# helper function to simplify the usage of debugpy
function debugpy() {
    local host
    local port

    # Check if the first argument is a valid IP address or hostname (assuming it's host)
    if [[ "$1" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ || "$1" == "localhost" ]]; then
        host="$1"
        port="${2:-5679}"  # Default port to 5679 if the second argument is not provided
        shift 2  # Shift the first two arguments
    else
        # Use default host and port
        host="0.0.0.0"
        port="5679"
    fi

    # Construct the debugpy command
    local cmd="python -m debugpy --wait-for-client --listen $host:$port $@"

    # Print the command for debugging
    echo "Executing: $cmd"

    # Execute the command
    eval $cmd
}

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/diegoallen/.lmstudio/bin"
# End of LM Studio CLI section

# Git diff with bat
batdiff() {
    git diff --name-only --relative --diff-filter=d -z | xargs -0 bat --diff
}

