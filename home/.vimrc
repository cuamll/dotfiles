set nocompatible
filetype off

"------- VUNDLE -------

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-abolish'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/a.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'flazz/vim-colorschemes'
Plugin 'whatyouhide/vim-gotham'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'

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

autocmd BufEnter ?akefile* set noexpandtab shiftwidth=8 softtabstop=0
autocmd BufLeave ?akefile* set expandtab shiftwidth=4 softtabstop=4


if !has('gui_running')
    let g:solarized_termtrans=1
endif

:set guioptions -=T
:set guioptions -=r
:set guioptions -=L
:set guioptions -=b
" Give global extra_conf.py for YouCompleteMe as a fallback
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1

let g:UltiSnipsSnippetsDir = "~/.vim/bundle/vim-snippets/snippets/"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:ycm_error_symbol = '!!'
let g:ycm_warning_symbol = '??'

" Remap YCM GoTo command to something less ridiculous
nmap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

"Allows you to use commas to start commands
let mapleader = ","

"Fast quitting?
noremap <leader>qq :q!<cr>
"Fast saving
noremap <leader>w :w!<cr>
"Easy edit of .vimrc
noremap <leader>vrc :vsp! $MYVIMRC<cr>

"easy switching of tabs
noremap <leader>tn :tabn<cr>
noremap <leader>tp :tabp<cr>

"Press Ctrl-J to split lines:
nnoremap <C-I> i<cr><Esc>

"Save and quit
noremap <leader>qw :wq<cr>

"clear highlighting
nnoremap <leader>c :nohl<cr>

"file browser ease
nnoremap <leader>exp :Explore<cr>
nnoremap <leader>exw :vsp /home/callum/Dropbox<cr>
nnoremap <leader>sx :Sex!<cr>

"Easy buffer movement:
map <C-W><C-J> <C-W>j<C-W>_
map <C-W><C-K> <C-W>k<C-W>_
map <C-W><C-L> <C-W>l<C-W>_
map <C-W><C-H> <C-W>h<C-W>_

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

"Default font
if has("win32")
    set guifont=Courier\ New:h10:cANSI
    set bs=2
    syntax on
else if has("gui_macvim")
    set guifont=Source\ Code\ Pro\ for\ Powerline
else
set guifont=Source\ Code\ Pro
endif

set dir=~/.vim_backups//
set backupdir=~/.vim_backups//
