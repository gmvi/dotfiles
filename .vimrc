set nocompatible " be vim, not vi
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" autocomplete
"Plugin 'Valloric/YouCompleteMe'

Plugin 'fatih/vim-go'

Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-commentary'

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-obsession'

Plugin 'scrooloose/syntastic'

Plugin 'Raimondi/delimitMate'

Plugin 'mxw/vim-jsx'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'wesQ3/vim-windowswap'

call vundle#end()

filetype plugin indent on
syntax on

colorscheme monokai

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

""""""""""""""

""" Leader """

let mapleader = "\<Space>"

nmap <Leader>` :set invlist<CR>

nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qall<CR>
nnoremap <Leader>w :w<CR>
map <Leader>y "+y
map <Leader>Y "+Y
map <Leader>p "+p
map <Leader>P "+P

vnoremap <Leader>d "+d
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
nnoremap gj Lzz
" make '' horizontally centered
noremap '' ''zz

" fixes scrooloose/syntastic not working with fatih/vim-go
let g:syntastic_always_populate_loc_list = 1

"""""""""""""""""""""""

""" Pane Navigation """
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-w><C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-w><C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-w><C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-w><C-l> :TmuxNavigateRight<CR>
nnoremap <silent> <C-w><C-o> :TmuxNavigatePrevious<CR>
"""""""""""""""""""""""

""" Pane Management """
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <C-w>y :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <C-w>p :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <C-w>v :vnew<CR>
nnoremap <silent> <C-w><CR> <C-w>=<C-w><BAR>80<C-w><LT>
nmap <silent> <C-w><SPACE> <C-w>y<C-w>h<C-w>p<C-w>H<C-w><CR>
nmap <silent> <C-w><C-SPACE> <C-w><SPACE>
nmap <silent> <C-w>e <C-w>l<C-w>n<C-w><SPACE>
nmap <C-w><C-e> <C-w>e
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

""" ideosyncracies """

inoremap kj <Esc>

""""""""""""""""""""""

""" extensions """

nnoremap ci/ T/ct/
nnoremap ca/ F/cf/
nnoremap ci, T,ct,
nnoremap ca, F,cf,

noremap f f
noremap F t
noremap s F
noremap S T
noremap t <Nop>
noremap T <Nop>

""""""""""""""""""

""" experiments """

" emacs-like bindings for line editing
imap <C-a> <Home>
imap <C-e> <End>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-S-b> <C-o>B
imap <C-S-f> <C-o>E
imap <C-d> <C-o>dl
nmap <C-d> dl
imap <C-h> <C-o>dh
nmap <C-h> dh
imap <C-S-d> <C-b><C-o>D
imap <C-S-h> <C-o>d0<C-h>

"""""""""""""""""""
