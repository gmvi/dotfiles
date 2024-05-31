""" Terminal
tnoremap <c-\><esc> <c-\><c-n>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
if has('nvim')
    au TermOpen * setlocal nonumber norelativenumber
endif
