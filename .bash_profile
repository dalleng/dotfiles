# Default editor
export EDITOR=lvim

# Use lvim as vim
alias vim='lvim'

# include hidden files and files in .gitignore
alias rg='rg --hidden --no-ignore'

# enables color in the terminal bash shell export
CLICOLOR=1

# sets up the color scheme for list export
LSCOLORS=gxfxcxdxbxegedabagacad

# alias for color highlighting in grep
alias grep='grep --color=auto'

# sets up the prompt color (currently a green similar to linux terminal)
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '

# sets up proper alias commands when called
alias ls='ls --color'
alias ll='ls -hla'

# infinite history :)
export HISTSIZE=""
export HISTFILESIZE=""

# ignore duplicates in history
export HISTCONTROL=ignoredups
export HISTCONTROL=erasedups

# locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# use homebrew installed apps instead of system defaults
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# add postgres.app bin dir to path
export PATH=/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH

# add android utilities to path
export ANDROID_HOME=/Users/diegoallen/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# use gnu coreutils
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# git completion script
source ~/.git-completion.bash

# autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Add GHC 7.8.3 to the PATH, via http://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.8.3.app"
if [ -d "$GHC_DOT_APP" ]; then
    export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

export GROOVY_HOME=/usr/local/opt/groovy/libexec

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Add rusts' cargo binaries
export PATH="$HOME/.cargo/bin:$PATH"

# fzf script
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# set up node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
