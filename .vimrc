""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""
"pathogen
execute pathogen#infect()

"set syntax highlighting
syntax on
filetype plugin indent on

"set auto read when file is changed outside
set autoread

"set line numbers
set number

"font encoding
set encoding=utf-8

"whitespace visualizing
set list listchars=tab:→\ ,trail:·

"color
colorscheme jellybeans

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

""""""""""""""""""""""""""""""
" UI
""""""""""""""""""""""""""""""

"Always show current position
set ruler

"Shows commang in the bottom right corner
set showcmd

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

""""""""""""""""""""""""""""""
" Latex stuff based here automatically
""""""""""""""""""""""""""""""
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

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
