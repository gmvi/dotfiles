set nocompatible " be vim, not vi
set nowrap " to be re-enabled later
filetype off " required

filetype plugin indent on
syntax on

"colorscheme monokai

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
map <Leader><insert> :set invpaste

vnoremap <Leader>d "+d
nnoremap <Leader><CR> :let @/ = ""<CR>

""""""""""""

""" Basic Mapping Smoothing """

" Y is a synonym for yy by default. Map it to y$ to conform to C and D.
noremap Y y$
" make U opposite of u
noremap U <C-r>
" K as the opposite of J (not mapped in visual mode)
nnoremap K i<CR><Esc>k:s/\s\+$//e<CR>$

""""""""""""""""

""" Movement """

" make '' horizontally centered
noremap '' ''zz

" fixes scrooloose/syntastic not working with fatih/vim-go
let g:syntastic_always_populate_loc_list = 1

"""""""""""""""""""""""

""" Pane Creation """
nnoremap <C-w>\ :vsp<CR>
nnoremap <C-w><C-\> <C-w>\

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

""""""""""""""""""

""" experiments """

" emacs-like bindings for line editing
imap <C-a> <Home>
imap <C-e> <End>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-h> <Backspace>
imap <C-d> <Del>
imap <C-p> <Up>
imap <C-n> <Down>

"""""""""""""""""""

noremap <silent> <Leader>:call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! nunmap <buffer> k
    silent! nunmap <buffer> j
    silent! nunmap <buffer> 0
    silent! nunmap <buffer> $
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    map  <buffer> <silent> k gk
    map  <buffer> <silent> j gj
    map  <buffer> <silent> 0 g0
    map  <buffer> <silent> $ g$
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction
call ToggleWrap()
