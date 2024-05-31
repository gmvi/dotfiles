""" ^Window management like tmux
" tabpage shortcuts like tmux windows
nnoremap n <C-W>gt
nmap  <C-W>n
nnoremap p <C-W>gT
nmap  <C-W>p
" c for create like tmux (use ^Wq to close a window - and remap ^Bq to ^Bx in tmux)
nnoremap c :tabnew<cr>
nmap  <C-W>c
" remap <C-Z> into <C-W> so <C-Z> can be used for undotree mappings
nnoremap  <C-Z>
nmap z <C-W>z
" TODO tmux-inspired pane rotation
" o for rotate 
"nnoremap <C-W>o 
"nnoremap <C-W>O <C-W>R
" maximize without closing other windows
nnoremap \ <C-W>_<C-W>|

