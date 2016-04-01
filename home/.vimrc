set nocompatible
filetype plugin indent on

"--- begin vim-plug ---

call plug#begin()

" tpope is a G
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-abolish'

" Code completion, syntax checking, etc.
Plug 'scrooloose/syntastic'

" Latex plugin only when needed
Plug 'lervag/vimtex', { 'on': 'TexToggle', 'for': ['tex', 'bib'] }
Plug 'vimwiki/vimwiki'

" other misc stuff that I've found I actually use
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/a.vim'
Plug 'rking/ag.vim'

" Couple of colour schemes
Plug 'altercation/vim-colors-solarized'
Plug 'whatyouhide/vim-gotham'
Plug 'tomasr/molokai'
Plug 'romainl/apprentice'

call plug#end()

" --- end vim-plug ---

" --- useful settings ---

set copyindent
set autoindent
"Ignore case if pattern is all lowercase, otherwise case-sensitive
set smartcase
"insert tabs at line start according to shiftwidth
set smarttab
"Expand tabs as spaces
set expandtab
"Tab completion stuff, apparently?
set wildmenu
set wildmode=list:longest,full
"Enable mouse support
set mouse=a

let shift_width = 2
let tab_stop = 2
let soft_tab_stop = 2

let &shiftwidth = shift_width
let &softtabstop = soft_tab_stop
set incsearch hlsearch

"Absolute number for current line, relative for others
set relativenumber
set number

set dir=~/.vim_backups//
set backupdir=~/.vim_backups//

"colour scheme
set background=dark
colorscheme apprentice

" Highlight a column
" set colorcolumn=72

" Set tab settings for makefiles only
autocmd BufEnter ?akefile* set noexpandtab shiftwidth=8 softtabstop=0
autocmd BufLeave ?akefile* set expandtab|let &shiftwidth=shift_width|let &softtabstop=soft_tab_stop

" set free source fortran
let fortran_free_source=1

"GUI Vim settings - gets rid of cruft around the edges
if has('gui_running')
    let g:solarized_termtrans=1
    :set guioptions -=r
    :set guioptions -=L
    :set guioptions -=b
endif

"Makes mouse reporting work properly on wide screens
if has ('mouse_sgr')
    set ttymouse=sgr
endif

"Default font
if has("win32")
    set guifont=Courier\ New:h10:cANSI
    set bs=2
    syntax on
elseif has("gui_macvim")
    set guifont=Source\ Code\ Pro\ for\ Powerline
else
set guifont=Source\ Code\ Pro\ for\ Powerline
" set highlight Normal ctermbg=None " Makes terminal vim transparent in Linux
endif

" --- set plugin variables ---

" --- airline ---
let g:airline_theme="raven"

" --- syntastic --- "
" Syntastic options
let g:syntastic_python_checkers = ['pylint', 'python']
let g:syntastic_cpp_checkers = ['cppcheck', 'gcc', 'make']
let g:syntastic_cpp_gcc_quiet_messages = { "level": "warnings",
                                         \ "file": ['\m^/opt/local','\m^/usr/include'] }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
nnoremap <F5> :SyntasticCheck<cr>
let g:syntastic_debug = 0

" --- remappings ---

let mapleader = ","

nnoremap ; :

"Fast quitting?
noremap <leader>qq :q!<cr>
"Fast saving
noremap <leader>w :w!<cr>
"Save and quit
noremap <leader>qw :wq<cr>
"Easy edit of .vimrc
noremap <leader>vrc :vsp! $MYVIMRC<cr>

"easy switching of tabs
noremap <leader>tn :tabn<cr>
noremap <leader>tp :tabp<cr>

"Press Ctrl-I to split lines:
nnoremap <C-I> i<cr><Esc>

"clear highlighting
nnoremap <leader>c :nohl<cr>

"file browser ease
nnoremap <leader>exp :Explore<cr>
nnoremap <leader>sx :Sex!<cr>

"Easy buffer movement:
map <C-W><C-J> <C-W>j<C-W>_
map <C-W><C-K> <C-W>k<C-W>_
map <C-W><C-L> <C-W>l<C-W>|
map <C-W><C-H> <C-W>h<C-W>|

"Remap jj to escape in insert mode
inoremap jj <Esc>

"Stops vim from 'jumping over' wrapped lines
nnoremap j gj
nnoremap k gk
