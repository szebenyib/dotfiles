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

" Call PluginInstall once done or having changed plugins

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" For moving around by searching for letters
Plugin 'easymotion/vim-easymotion'
" For finding files in a folder tree
Plugin 'scrooloose/nerdtree'
" For finding files by name
Plugin 'kien/ctrlp.vim'
" For finding files by content
Plugin 'mileszs/ack.vim'
" For a better statusline
Plugin 'bling/vim-airline'
" For git support, editing and gutter
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
" For autocompletion
Plugin 'valloric/youcompleteme'
" For snippets
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
"Plugin 'tomtom/tcomment_vim'
" For comment toggling
Plugin 'tpope/vim-commentary'
" For some quick actions
Plugin 'tpope/vim-unimpaired'
" For easier management of surrounding tags, apostrophes
Plugin 'tpope/vim-surround'
" For mass replace across files
Plugin 'yegappan/greplace'
" For CSV highlighting and editing
Plugin 'chrisbra/csv.vim'
" For javascript completion
Plugin 'ternjs/tern_for_vim'
" For javascript linting
if has('nvim')
	" Linting
	Plugin 'neomake/neomake'
	" Location list opener
	let g:neomake_open_list = 2
	let g:neomake_list_height = 3
	" Replacing default markers
	let g:neomake_warning_sign = {
		\ 'text': 'W',
		\ 'texthl': 'WarningMsg',
		\ }
	let g:neomake_error_sign = {
		\ 'text': 'E',
		\ 'texthl': 'ErrorMsg',
		\ }
	" Autoclose location window
	aug QFClose
	au!
	au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
	aug END
else
	" Linting
	Plugin 'vim-syntastic/syntastic'
endif
" For javascript syntax highlight
Plugin 'pangloss/vim-javascript'
" For json syntax highlight
Plugin 'elzr/vim-json'
" For same-key tmux and vim navigation
Plugin 'christoomey/vim-tmux-navigator'
" For on-the-fly markdown display
" Make sure that xdg-util and curl are installed
" And npm install -g instant-markdown-d
Plugin 'suan/vim-instant-markdown'
" For a calendar
Plugin 'itchyny/calendar.vim'

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

"changing leader
:let mapleader = "é"

"tab stop
set tabstop=2

"set shiftwidth for default indenting (javascript, ui5)
set shiftwidth=2

"set auto read when file is changed outside
set autoread

"set line numbers
set number

"font encoding
set encoding=utf-8

"whitespace visualizing
set list listchars=tab:→\ ,trail:·

"automatic search while typing
set incsearch

"case insensitive search
set ignorecase

"automatic highlight all search matches
"and automatic disable afterwards
set hlsearch
nnoremap <esc> :noh<return><esc>

"disable bak files
set nobackup

"change mapleader from / to -
noremap - /
noremap / -

" Map key to toggle opt
"nmap <F2> :set wrap!<CR>
"function MapToggle(key, opt)
"  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
"  exec 'nnoremap '.a:key.' '.cmd
"  exec 'inoremap '.a:key." \<C-O>".cmd
"endfunction
"command -nargs=+ MapToggle call MapToggle(<f-args>)
" Display-altering option toggles
"MapToggle <F1> hlsearch
"MapToggle <F2> wrap
"MapToggle <F3> list
"
"" Behavior-altering option toggles
"MapToggle <F10> scrollbind
"MapToggle <F11> ignorecase
"MapToggle <F12> paste
"set pastetoggle=<F12>

"color
"let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme solarized
"silent! colorscheme inori
"colorscheme jellybeans

"window size
if has("nvim")

else
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
endif

"copy to system clipboard by default
" Install xclip for neovim
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

" Overwritten with ag for Gsearch
" set grepprg=grep\ -nH\ $*
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
" NERDTree
""""""""""""""""""""""""""""""

" Ctrl-n for NERDTree
:map <C-n> :NERDTreeToggle<CR>

" Autoopen vim if no file is specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

""""""""""""""""""""""""""""""
" Markdown support
""""""""""""""""""""""""""""""

" You have to install markdown in your guest os

nmap <leader>md :%!/usr/bin/markdown --html4tags<CR>

""""""""""""""""""""""""""""""
" Easy motion
""""""""""""""""""""""""""""""

" Disable default mappings
let g:EasyMotion_do_mapping = 0

" Search for words with leader and w
nmap é <Plug>(easymotion-overwin-f2)

" Make it case insensitive
let g:EasyMotion_smartcase = 1

""""""""""""""""""""""""""""""
" YouCompleteMe
""""""""""""""""""""""""""""""

let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1

""""""""""""""""""""""""""""""
" UtilSnips and YouCompleteMe using supertab
""""""""""""""""""""""""""""""

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


""""""""""""""""""""""""""""""
" Gsearch - mass replace
""""""""""""""""""""""""""""""

" Updating grepprg will have consequences on other commands
" that rely on grep vim command
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

""""""""""""""""""""""""""""""
" Tern, javascript, eslint
""""""""""""""""""""""""""""""

if has('nvim')
	autocmd! BufWritePost,BufEnter * Neomake
	let g:neomake_javascript_enabled_makers = ['eslint']
	let g:neomake_css_enabled_makers = ['csslint']
	let g:neomake_json_enabled_makers = ['jsonlint']
	let g:neomake_markdown_enabled_makers = ['markdownlint']
else
	" set statusline+=%#warningmsg#
	" set statusline+=%{SyntasticStatuslineFlag()}
	" set statusline+=%*
	" let g:syntastic_always_populate_loc_list = 1
	" let g:syntastic_auto_loc_list = 1
	" let g:syntastic_check_on_open = 1
	" let g:syntastic_check_on_wq = 0

	" let g:syntastic_javascript_checkers = ['eslint']
	" " Via package.json/scripts/lint:
	" " let g:syntastic_javascript_eslint_exe = 'npm run lint --'
	" let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint_d'
endif

""""""""""""""""""""""""""""""
" CtrlP
""""""""""""""""""""""""""""""

" Ignoring: node, git, jsdoc
let g:ctrlp_custom_ignore = 'node_modules\|git\|out'

""""""""""""""""""""""""""""""
" Ack/Ag use Ag
""""""""""""""""""""""""""""""

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

""""""""""""""""""""""""""""""
" Calendar google integration
""""""""""""""""""""""""""""""

let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
:nmap <expr> <F3> &ft ==# 'calendar' ? "\<Plug>(calendar_exit)" : ":\<C-u>Calendar\<CR>"
:nmap <expr> <F4> &ft ==# 'calendar' ? "\<Plug>(calendar_exit)" : ":\<C-u>Calendar -view=year -split=vertical -width=27\<CR>"
