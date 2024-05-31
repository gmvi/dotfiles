
" TODO: my +2
" use this if you want insert mode <c-right> to work like readline
inoremap <c-right> <c-o>E<right>


" the following insert-mode control-keys are left available for the user
"inoremap <C-L> <Cmd>redraw<CR>
"inoremap <C-S> <Nop>
"inoremap <C-Z> <Nop>
" the following are not very useful when you can just use =
"inoremap <C-T> exe '"Emulating vim's <C-T>/<C-D> requires a function'
"inoremap <C-S-T> <C-D>

" control keys
nmap  <Nop> " In vim, alias for <C-V>; unused
nmap  <Nop> " Searching with telescope.nvim
nmap  <Nop> " I use this for my terminal multiplexer
nmap  <Nop> " In vim, alias for PgDn; use <C-D> instead
" <C-K> is unmapped by default
nmap <C-L> <Nop>
nmap  <Nop> " In unix, suspends and exits vim. I remap this to <C-W><C-Z>
nnoremap  <C-Z>
nmap z <C-W><C-Z>
nmap  <Nop> " In vim, alias for PgUp
nmap  <Nop>
nmap  <Nop> " In vim, reverses text direction. Typed as <C-/>





""" Adjustments
"" normal
" U as redo (opposite of u)
nnoremap U <C-R>
nnoremap <C-Z> u
"nnoremap <C-R> ":UndoTree
" vertically center the screen when returning to previous jump
nnoremap '' ''zz
" vertically center the cursor when scrolling ^Up or ^Down
nnoremap <C-U> <C-U>M
nnoremap <C-D> <C-D>M
" escape to hide search highlights
nnoremap <Esc> <cmd>noh<cr>
nnoremap <C-C> <cmd>noh<cr>
"" insert
" <C-C> as an alias for <ESC>
" also j+k pressed simultaneously
" use <C-Q> if you want the effect of <C-C> (e.g. cancel a visual block insert)
inoremap <C-C> <Esc>
inoremap kj <Esc>
inoremap jk <Esc>
inoremap <C-G> <Esc>
inoremap <C-Q> <C-C>
" n/N in normal mode should open folds
nnoremap n nzv
nnoremap N Nzv
" >/< should return you to visual mode. Also char-visual >/< is a linewise
" action, and now it forces you into line-visual mode.
function! remaps#reindentForceLinewise()
    if visualmode() ==# "v" | exe "norm gvV" | else | exe "norm gv" | endif
endfunction
xnoremap > ><Cmd>call remaps#reindentForceLinewise()<CR>
xnoremap < <<Cmd>call remaps#reindentForceLinewise()<CR>
" (/) (sentence) are useless for coding. {/} are barely any more useful than ^U/^D
" TODO: what to do with these?



""" Normal/Visual mode ctrl keys
" ctrl-e and ctrl-y in visual mode scroll the view just like normal mode
" ctrl-e and ctrl-y, but also move the selection with you and format with v_=
xnoremap <c-y> :m '<-2<cr>gv=gv<c-y>
xnoremap <c-e> :m '>+1<cr>gv=gv<c-e>
"" Boop.vim
augroup boop_mapping
    autocmd!
    autocmd BufEnter,FileType boop call s:BoopMapping()
augroup END
function! s:BoopMapping()
    nnoremap <buffer> <C-L> :ListBoopScripts<CR>
endfunction



""" New stuff
" c*/c# and d*/d#
nnoremap c* *``cgn
nnoremap c# #``cgN
nnoremap d* *``dgn
nnoremap d# #``dgN


""" <Leader> expressions
source $HOME/.config/nvim/my/leader_typos.vim
" Don't do leader key's normal function if you hit it twice or try to cancel
nmap <leader><leader> <nop>
nmap <leader><backspace> <nop>
nmap <leader><del> <nop>
" update instead of :w, with saveas for unnamed files
nnoremap <expr> <leader>W len(expand('%:t')) ? ':w<cr>' : ':saveas '
nnoremap <expr> <leader>ww len(expand('%:t')) ? ':update<cr>' : ':saveas '
nnoremap <leader>wq :up\|q<cr>
" toggle some settings
nnoremap <leader>sl :set list!<cr>:set list?<cr>
nnoremap <leader>sw :set wrap!<cr>:set wrap?<cr>
nnoremap <leader>sp :set paste!<cr>:set paste?<cr>
" show all global marks
nnoremap <leader>M :marks ABCDEFGHIJKLMNOPQRSTUVWXYZ<cr>
" treesitter
nnoremap <leader>tp :TSPlaygroundToggle<cr>
" undotree
nnoremap <leader>ut :UndotreeToggle<cr>
" git fugitive
nnoremap <leader>gs :Git<cr>
" rename symbol
nnoremap <leader>rs :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>



