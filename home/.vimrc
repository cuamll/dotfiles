"--- plugins ---

call plug#begin()

" obligatory tpope section
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'

Plug 'w0rp/ale'
Plug 'lervag/vimtex'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'

" Colour schemes
Plug 'whatyouhide/vim-gotham'
Plug 'romainl/apprentice'
Plug 'junegunn/seoul256.vim'

call plug#end()

" --- end vim-plug ---

" --- useful settings ---

syntax enable
set copyindent autoindent
set smartcase smarttab expandtab
set splitright
set mouse=a
set incsearch hlsearch

" set relativenumber number does absolute for current line only. BUT
" becomes very slow in large files with long lines e.g. tex files!
set number

" avoid swap files etc. piling up everywhere
set dir=~/.vim_backups//
set backupdir=~/.vim_backups//

"colour scheme
set background=dark
let g:seoul256_background = 235
colo seoul256

" Highlight a column
set colorcolumn=80

" Tab settings
let shift_width = 2
let tab_stop = 2
let soft_tab_stop = 2
let &shiftwidth = shift_width
let &softtabstop = soft_tab_stop
" Sort out makefile tab requirements
augroup Tabs
  " clear events -- not sure if this is necessary in this case?
  autocmd! Tabs
  autocmd BufEnter ?akefile*,*.c,*.h set noexpandtab shiftwidth=8 softtabstop=0
  autocmd BufLeave ?akefile*,*.c,*.h, set expandtab|let &shiftwidth=shift_width|let &softtabstop=soft_tab_stop
augroup END

" enable spell checking for tex files
autocmd FileType tex,wiki,txt,md setlocal spell spelllang=en_gb

if has('gui_running')
    :set guioptions =c
endif

"Makes mouse reporting work properly on wide screens
if has ('mouse_sgr')
    set ttymouse=sgr
endif

set guifont=Source\ Code\ Pro\ 13
"
" --- set plugin variables ---

" git branch information in lightline: taken from :h lightline example
let g:lightline = {
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'fugitive#head'
        \ },
        \ }

let g:lightline.colorscheme = 'seoul256'

let g:tex_flavor = 'latex'
let g:vimtex_quickfix_enabled = 0

" This is just useful for using latex with git
command! SplitLines %s/\. /\.\r/g
nnoremap <leader>sp :SplitLines<cr> :nohl<cr>

let fortran_free_source=1
" If file type is just .f then assume F77, fixed source
augroup filetypedetect
    au BufRead,BufNewFile *.f let fortran_free_source=0
augroup END
let g:ale_fortran_gcc_executable = 'gfortran-mp-5'
let g:ale_fortran_gcc_options = '-Jmod -std=f2003 -fopenmp'
let g:ale_fortran_gcc_use_free_form = 1

" --- remappings ---

let mapleader = ","
nnoremap ; :
inoremap jj <Esc>
"Stops vim from 'jumping over' wrapped lines
nnoremap j gj
nnoremap k gk
nnoremap <leader><Space> :nohl<cr>
nnoremap <leader>ms :mksession '~/.vim/Session.vim'<cr>

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
