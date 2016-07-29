""" Header """

" required for vundle?
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

""""""""""""""""""""""

""" Vundle Plugins """

" git wrapper " TODO: learn
Plugin 'tpope/vim-fugitive'

" commenting " TODO: learn
Plugin 'tpope/vim-commentary'

" surrond " TODO: learn
Plugin 'tpope/vim-surround'

" syntax
Plugin 'scrooloose/syntastic'

" autocomplete too slow " TODO: investigate
" Plugin 'Valloric/YouCompleteMe'

" autoinsert delimiter " TODO: does it work? is it on?
Plugin 'Raimondi/delimitMate'

" golang!
Plugin 'fatih/vim-go'

""""""""""""""
" Required by Vundle. All plugins must be defined above.
call vundle#end()          " required
filetype plugin indent on  " enables filetype plugins

""""""""""""""

""" Basics """

" many features are disabled by default for resource-deprived setups
set backspace=eol,start,indent " sane backspace behavior
set number " show line numbers
syntax enable " syntax highlighting
set hidden " allow hidden buffers
set history=100 " remember last 100 command

" per-directory .vimrc files and lock-down autocmd
set exrc
set secure

""""""""""""""

""" Leader """

let mapleader = "\<Space>"
" control type functionality
" open a new file
nnoremap <Leader>n :CtrlP<CR>
nnoremap <Leader>w :w<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"""""""""""""""""""""""""""""""

""" Basic Mapping Smoothing """

" Y is a synonym for yy by default. Map it to y$ to conform to C and D.
map Y y$
" make U opposite of u
map U <c-r>

""""""""""""""""

""" Movement """

" horizontally-centered page-up/down
map gk HzbM
map gj LztM
" make '' horizontally centered
map '' ''zz

" fixes scrooloose/syntastic not working with fatih/vim-go
let g:syntastic_always_populate_loc_list = 1

"""""""""""""""""""""""

""" File Management """

" hide certain patterns
let g:netrw_list_hide = '^\./$' " comma-seperated regexes
" turn it on
let g:netrw_hide = 1
" tree view?
let g:netrw_liststyle=3

" tab movement
nnoremap <Leader>h :tabN<CR>
nnoremap <Leader>l :tabn<CR>
nnoremap <Leader>H :tabm -1<CR>
nnoremap <Leader>L :tabm +1<CR>

" tabbar settings
hi TabLineFill ctermfg=0

""""""""""""""""""""""""

""" netrw Keymapping """

augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
    noremap <buffer> gl :tabn<CR>
    noremap <buffer> gh :tabN<CR>
endfunction

""""""""""""""""""

""" Unreviewed """

set re=1

set wildmenu
set wildignore=*.o,*.~,*.pyc

set ignorecase
set smartcase
set autoindent
set nostartofline
set ruler

set cmdheight=2
set encoding=utf8
"set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

colorscheme monokai

set backupcopy=yes

""""""""""""""""""""""

""" Ideosyncracies """

imap kj <Esc>
nmap 'm 'mzz

"""""""""""""""""""""""""""""""""""""

""" alt-bracket indentation hacks """

nmap Û <<hh
nmap <m-[> <<hh
nmap <m-]> >>ll
imap Û <Esc><<hha
imap <m-[> <Esc><<hha
imap <m-]> <Esc>>>lla
vmap Û <
vmap <m-[> <
vmap <m-]> >

"""""""""""""""""""""""""""""""""""""
