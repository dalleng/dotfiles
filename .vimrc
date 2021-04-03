" ------ Vundle Settings ------

set nocompatible               " be iMproved
filetype off                   " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Third-party plugins
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'bling/vim-airline'
Plugin 'davidhalter/jedi-vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'wesQ3/vim-windowswap'
Plugin 'posva/vim-vue'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'mkitt/tabline.vim'
Plugin 'ambv/black'
Plugin 'tpope/vim-surround'

call vundle#end()


" ------ Default editing settings ------

imap jj <Esc>       " Avoid using esc in insert mode
let mapleader=','   " set ',' as the leader key
color smyck
syntax on           " set syntax highlighting
set t_Co=256        " makes vim use 256 colors terminal
set tabstop=4       " a tab is four spaces
set shiftwidth=4    " number of spaces to use for autoindenting
set expandtab       " replace tabs with spaces
set number          " always show line numbers
set nowrap          " disable line wrapping

set smarttab        " insert tabs on the start of a line according to
                    " shiftwidth, not tabstop
                    
set hlsearch            " highlight search terms
set incsearch           " show search matches as you type
set ignorecase          " case Insensitive Searching
set autoindent          " always set autoindenting on
set copyindent          " copy the previous indentation on autoindenting
set noswapfile          " no more swap file
set nobackup            " no more backup file
set nowritebackup       " change save behavior to avoid using the backup file
set clipboard=unnamed   " compatible with system clipboard
set mouse=a             " enables mouse (scrolling, selection, etc.)
set autoread            " autoread file on change


"set colorcolumn=80   " highlights the 80th column
hi ColorColumn ctermbg=grey guibg=springgreen

set guifont=Fira\ Code:h11 " Sets Fira Code as the font

" ------ Settings according to filetype ------

autocmd FileType htmldjango
  \ setlocal shiftwidth=2 |
  \ setlocal tabstop=2 |
autocmd FileType html
  \ setlocal shiftwidth=2 |
  \ setlocal tabstop=2 |
autocmd FileType css
  \ setlocal shiftwidth=2 |
  \ setlocal tabstop=2 |
autocmd FileType javascript
  \ setlocal shiftwidth=2 |
  \ setlocal tabstop=2
autocmd FileType vue
  \ setlocal shiftwidth=2 |
  \ setlocal tabstop=2
autocmd Filetype py
  \ set tabstop=4 |
  \ set shiftwidth=4
autocmd Filetype java
  \ set tabstop=4 |
  \ set shiftwidth=4 |

" ------ Plugin settings ------

" airline
set laststatus=2
let g:airline_powerline_fonts = 1

" Flake8 plugin for python
"source ~/.vim/bundle/vim-flake8/ftplugin/python_flake8.vim
autocmd BufWritePost *.py call Flake8()

" Nerdcommenter
filetype plugin on

" ------ Keyboard Mappings ------

" Toggles NERDTree on/off
map <leader><leader> :NERDTreeTabsToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Insert new line without going to insert mode
nmap <CR> o<Esc>

" Set left and right option/alt keys to be meta keys
if has("gui_macvim")
    set macmeta
endif

" Bash like combinations for vim's command line
:cnoremap <C-a>  <Home>
:cnoremap <C-b>  <Left>
:cnoremap <C-f>  <Right>
:cnoremap <C-d>  <Delete>
:cnoremap <M-b>  <S-Left>
:cnoremap <M-f>  <S-Right>

" Jedi Vim
" I don't want the docstring window to popup during completion
autocmd FileType python setlocal completeopt-=preview
" use tabs for go to defninitions
let g:jedi#use_tabs_not_buffers=1

" Ignore node_modules folder and vcs folders in ctrlp
set wildignore+=*/node_modules/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ }

let g:black_linelength=119

" Run macro in multiple lines in Vim
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction
