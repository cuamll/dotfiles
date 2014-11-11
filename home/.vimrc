set nocompatible
filetype off

"------- VUNDLE -------

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'Lokaltog/vim-easymotion'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-abolish'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/a.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'whatyouhide/vim-gotham'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

call vundle#end()
filetype plugin indent on
" -- END OF VUNDLE SETTINGS--

"other things to set
set copyindent
set autoindent
set relativenumber
set number
set background=dark
colorscheme solarized

if !has('gui_running')
    let g:solarized_termtrans=1
endif

" Give global extra_conf.py for YouCompleteMe as a fallback
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" Change ultisnips triggers so they don't conflict with YouCompleteMe
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"Allows you to use commas to start commands
let mapleader = ","

"Fast quitting?
noremap <leader>qq :q!<cr>
"Fast saving
noremap <leader>w :w!<cr>
"Easy edit of .vimrc
noremap <leader>vrc :sp! $MYVIMRC<cr>

"easy switching of tabs
noremap <leader>tn :tabn<cr>
noremap <leader>tp :tabp<cr>

"Press Ctrl-J to split lines:
nnoremap <C-J> i<cr><Esc>

"Save and quit
noremap <leader>qw :wq<cr>

"clear highlighting
nnoremap <leader>c :nohl<cr>

"file browser ease
nnoremap <leader>exp :Explore<cr>
nnoremap <leader>exw :vsp /home/callum/Dropbox<cr>
nnoremap <leader>sx :Sex!<cr>

"Easy buffer movement:
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

"Ignore case if pattern is all lowercase, otherwise case-sensitive
set smartcase
"insert tabs at line start according to shiftwidth
set smarttab
"Expand tabs as spaces
set expandtab
"Tab completion stuff, apparently
set wildmenu
set wildmode=list:longest,full
"Enable mouse support
set mouse=a
"Remap jj to escape in insert mode
inoremap jj <Esc>

" nnoremap JJJJ <Nop>
set shiftwidth=4 softtabstop=4
set incsearch ignorecase hlsearch
"Press space to clear search highlighting and any message already displayed.
"nnoremap <silent> <Space> :silent noh<Bar>echo<cr>
"Stops vim from 'jumping over' wrapped lines
nnoremap j gj
nnoremap k gk
"No more colons
nnoremap ; :
"Remap :q! to :qq for speeds
nnoremap :qq :q!

"Default font
if has("win32")
    set guifont=Courier\ New:h10:cANSI
    set bs=2
    syntax on
else
set guifont=Source\ Code\ Pro
endif

set dir=~/.vim_backups//
set backupdir=~/.vim_backups//
