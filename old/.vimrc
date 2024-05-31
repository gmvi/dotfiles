set nocompatible " be vim, not vi
filetype off " required

" plugins here

filetype plugin indent on
syntax on

" split L-to-R and U-to-D
set splitbelow
set splitright

" numbering
set number
set relativenumber

" case insensitive searching
set ignorecase
set smartcase

" path completion
set wildmode=longest,list
set wildmenu
set wildignore=*.o,*.~,*.pyc

" searching
set hlsearch
" highlight clearing macro set to <Leader><CR>

set backspace=eol,start,indent " sane backspace behavior
set hidden " allow hidden buffers
set history=100 " remember last 100 command

" per-directory .vimrc files and lock-down autocmd
set exrc
set secure

set bg=dark

""""""""""""""

""" Leader """

let mapleader = "\<Space>"

nnoremap <Leader>` :set invlist<CR>

nnoremap <Leader><CR> :let @/ = ""<CR>

""""""""""""

""" NVIM """

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  "tnoremap <C-n> <C-\><C-n>:tabe<CR>:term<CR>
endif

""""""""""""""""""""""""""""""

""" Basic Mapping Smoothing """

" Y is a synonym for yy by default. Map it to y$ to conform to C and D.
noremap Y y$
" make U opposite of u
noremap U <C-r>
" K as the opposite of J (not mapped in visual mode)
nnoremap K i<CR><Esc>k:s/\s\+$//e<CR>$

""""""""""""""""

""" Movement """

" move top or bottom line to center
nnoremap gk Hzz
nnoremap gj Lkzz
" make '' horizontally centered
noremap '' ''zz

" fixes scrooloose/syntastic not working with fatih/vim-go
"let g:syntastic_always_populate_loc_list = 1

"""""""""""""""""""""""

""" Pane Navigation """
"let g:tmux_navigator_no_mappings = 1
"nnoremap <silent> <C-w><C-h> :TmuxNavigateLeft<CR>
"nnoremap <silent> <C-w><C-j> :TmuxNavigateDown<CR>
"nnoremap <silent> <C-w><C-k> :TmuxNavigateUp<CR>
"nnoremap <silent> <C-w><C-l> :TmuxNavigateRight<CR>
"nnoremap <silent> <C-w><C-o> :TmuxNavigatePrevious<CR>
"""""""""""""""""""""""

""" Pane Management """
"""""""""""""""""""""""

""" File Management """

" hide certain patterns
let g:netrw_list_hide = '^\./$' " comma-seperated regexes
" turn it on
let g:netrw_hide = 1
" tree view?
let g:netrw_liststyle=3

" tabbar settings
hi TabLineFill ctermfg=0

""""""""""""""""""""""""

""" Unreviewed """

"set re=1

set autoindent
set nostartofline
set ruler

set cmdheight=2
if !has('nvim')
  set encoding=utf8
endif
set expandtab

set backupcopy=yes

set list
set listchars=eol:¬,tab:!·,trail:∙,nbsp:∘
set invlist

""""""""""""""""""

""" extensions """

nnoremap ci/ T/ct/
nnoremap da/ F/dt/

""""""""""""""""""

""" experiments """

" emacs-like bindings for line editing
imap <C-a> <Home>
imap <C-e> <End>
imap <C-b> <C-o>h
imap <C-f> <C-o>l
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-d> <C-o>dl
nmap <C-d> dl
imap <C-h> <C-o>dh
nmap <C-h> dh

"""""""""""""""""""
