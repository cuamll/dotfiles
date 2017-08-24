set nocompatible
filetype plugin indent on

"--- begin vim-plug ---

call plug#begin()

" obviously
Plug 'tpope/vim-sensible'

Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vimwiki/vimwiki'
Plug 'lervag/vimtex'
" , { 'on': 'TexToggle', 'for': ['tex', 'bib'] }

" considering getting rid of these
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

" Couple of colour schemes
Plug 'altercation/vim-colors-solarized'
Plug 'whatyouhide/vim-gotham'
Plug 'tomasr/molokai'
Plug 'romainl/apprentice'
Plug 'junegunn/seoul256.vim'

call plug#end()

" --- end vim-plug ---

" --- useful settings ---

syntax enable
set copyindent
set autoindent
set smartcase
set smarttab
set expandtab
set splitright
set mouse=a
set incsearch hlsearch
" Tab completion stuff? Could probably remove
set wildmenu
set wildmode=list:longest,full

"Absolute number for current line, relative for others
set relativenumber
set number

" avoid swap files etc. piling up everywhere
set dir=~/.vim_backups//
set backupdir=~/.vim_backups//

"colour scheme
set background=dark
colorscheme apprentice

" Highlight a column
set colorcolumn=80

" Tab settings
let shift_width = 2
let tab_stop = 2
let soft_tab_stop = 2
let &shiftwidth = shift_width
let &softtabstop = soft_tab_stop
" Sort out makefile tab requirements
autocmd BufEnter ?akefile* set noexpandtab shiftwidth=8 softtabstop=0
autocmd BufLeave ?akefile* set expandtab|let &shiftwidth=shift_width|let &softtabstop=soft_tab_stop

" set free source fortran
let fortran_free_source=1

" enable spell checking for tex files
autocmd FileType tex,wiki,txt,md setlocal spell spelllang=en_gb
"setlocal spell spelllang=en_gb

"GUI Vim settings - gets rid of cruft around the edges
if has('gui_running')
    "let g:solarized_termtrans=1
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

" --- vimtex ---
let g:vimtex_quickfix_ignored_warnings = [
    \ 'Underfull',
    \ 'csquotes',
    \ 'Overfull',
    \ 'specifier changed to',
    \ '\float@addtolists',
  \ ]

" --- airline ---
let g:airline_theme="raven"

" --- syntastic --- "
" Syntastic options
let g:syntastic_fortran_compiler = 'gfortran'
let g:syntastic_fortran_checkers = ['gfortran']
let g:syntastic_python_checkers = ['pylint', 'python']
let g:syntastic_cpp_checkers = ['cppcheck', 'gcc', 'make']
"let g:syntastic_cpp_gcc_quiet_messages = { level: warnings",
                                        " \ file": ['\m^/opt/local','\m^/usr/include'] }
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
nnoremap <F5> :SyntasticCheck<cr>
let g:syntastic_debug = 0

" --- vimwiki ---
"let g:vimwiki_list = [{'path': '~/research/', 'path_html': '~/research_html/'}]

" --- remappings ---

let mapleader = ","
nnoremap ; :
noremap <leader>qq :q!<cr>
noremap <leader>w :w!<cr>
noremap <leader>qw :wq<cr>
inoremap jj <Esc>
"Stops vim from 'jumping over' wrapped lines
nnoremap j gj
nnoremap k gk
nnoremap <leader><Space> :nohl<cr>

"easy switching of tabs
noremap <leader>tn :tabn<cr>
noremap <leader>tp :tabp<cr>
"Easy edit of .vimrc
noremap <leader>vrc :vsp! $MYVIMRC<cr>
"Press Ctrl-I to split lines:
nnoremap <C-I> i<cr><Esc>gk$
"file browser ease
nnoremap <leader>exp :Explore<cr>
nnoremap <leader>sx :Sex!<cr>

