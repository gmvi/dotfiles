if !has('nvim')
    set nocompatible
    set backspace=indent,eol,start
    set history=1000
    set bg=dark
endif
set hidden
set mouse=a
set number relativenumber
set ruler
set splitbelow splitright
set title
"set noshowmode " only if you have a statusline indicator
set nowrap
set showtabline=2
set tabstop=4 sts=4 sw=4 expandtab
set smarttab autoindent
set hlsearch incsearch
set ignorecase smartcase
set wildmenu
"TODO: eval wilmode and wildignore
"set wildmode=list:longest,list:full
set wildmode=longest:full,full
set scrolloff=8 sidescrolloff=5
set colorcolumn=81
set showbreak=↪\
set listchars=tab:├┄,eol:¬,extends:…,precedes:…,nbsp:␣,trail:·
set notimeout
set breakindent
set updatetime=250
set cursorline

" TODO: undotree functionality

" When re-loading this file, set hlsearch turns on any hidden highlights
" I don't want to type :noh<CR> every thime I reload my init
nohlsearch

if has('nvim')
    lua <<
    vim.g.have_nerd_font = true
    vim.g.inccommand = "split"
.

    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
    " This is to open all the folds defined by treesitter 
    autocmd BufReadPost,FileReadPost * normal zR
end
