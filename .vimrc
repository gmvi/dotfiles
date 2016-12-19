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
vnoremap <Leader>y "+y
" recursive mapping because Y is nmapped below
vmap <Leader>Y "+Y
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

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
nnoremap K i<CR><Esc>k$

""""""""""""""""

""" Movement """

" horizontally-centered half-page-up/down
nnoremap gk Hkzz
nnoremap gj Ljzz
" make '' horizontally centered
noremap '' ''zz

" fixes scrooloose/syntastic not working with fatih/vim-go
let g:syntastic_always_populate_loc_list = 1

"""""""""""""""""""""""

""" Pane Navigation """
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-/> :TmuxNavigatePrevious<cr>
"""""""""""""""""""""""

""" Pane Management """
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <c-w>y :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <c-w>p :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <c-w><cr> <c-w>=<c-w><bar>40<c-w><lt>
nmap <silent> <c-w><space> <c-w>y<c-w>h<c-w>p<c-w><cr>
nmap <silent> <c-w><c-space> <c-w><space>
nmap <silent> <c-w>e <c-w>l<c-w>n<c-w><space>
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

""""""""""""""""""

""" experiments """
" squish w/e/b into w/e as back/end
noremap w b
noremap W B
noremap b <Nop>
noremap B <Nop>
" disable s
noremap s <Nop>
noremap S <Nop>

"""""""""""""""""""
