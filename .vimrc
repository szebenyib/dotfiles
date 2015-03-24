""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" The runtimepath is required for LaTeX, but it has to be added here!
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""
"pathogen
""""""""""""""""""""""""""""""

"execute pathogen#infect()
"generate helptags for everything in runtimepath
"call pathogen#helptags() 

"Needed for Vim R plugin
"set nocompatible

"set syntax highlighting
syntax on
"filetype on
"filetype plugin indent on

"set auto read when file is changed outside
set autoread

"set line numbers
set number

"font encoding
set encoding=utf-8

"whitespace visualizing
set list listchars=tab:→\ ,trail:·

"color
let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme solarized
"silent! colorscheme inori
"colorscheme jellybeans

"window size
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=999 columns=999
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif

"copy to system clipboard by default
set clipboard=unnamedplus

"general mapping
:command WQ wq
:command Wq wq
:command W w
:command Q q

""""""""""""""""""""""""""""""
" Django
""""""""""""""""""""""""""""""
autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType html set ft=htmldjango.html " For SnipMate

""""""""""""""""""""""""""""""
" UI
""""""""""""""""""""""""""""""

"Always show current position
set ruler

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l+%c

""""""""""""""""""""""""""""""
" Latex stuff based here automatically
""""""""""""""""""""""""""""""
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"


"Changing default output to pdf instead of dvi
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'"""""""""""""""""""""""""""

" Mutt
""""""""""""""""""""""""""""""
"72 for mutt
au BufRead /tmp/mutt-̣̣* set tw=72
set cc=80
"flow for mutt
"setlocal fo+=aw

""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""

"Bind F7 to spell checking on
:map <F7> :set spell<CR>
:map <F5> :setlocal spell spelllang=en_us<CR>
:map <F6> :setlocal spell spelllang=hu<CR>


""""""""""""""""""""""""""""""
" Arduino
""""""""""""""""""""""""""""""

au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

