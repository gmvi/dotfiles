""" Dumb stuff

" pretending netrw doesn't exist, for fun!
function! ENewIf()
    if wordcount().bytes || len(expand('%:t'))
        enew
    endif
endfunction
function! Jankrw()
    silent b [cmd]
    if expand('%:t') == '[cmd]'
        normal ggdG
    else
        if wordcount().bytes || len(expand('%:t'))
            enew
        endif
        silent 0f | f [cmd]
    endif
    redir => str | silent pwd | redir END | put=str
    r !find * -type f
    normal ggdd
endfunction
nnoremap <leader>nb :call ENewIf()<cr>
nnoremap <leader>* :call Jankrw()<cr>
" to open a file, yank the line and do "0gf (see below)


" yank absolute filenames into registers
"nnoremap y% :execute 'let' '@'.v:register.'=expand("%:p")'<cr>
" upgrade gf to open absolute filenames from registers
"fun! BetterGF() abort
"    if v:register == '"'
"        " if we didn't pass a register, open <cfile>
"        normal gf
"    else
"        " if we passed a register to gf, try to open it
"        let maybeFile = getreg(v:register)
"        if filereadable(maybeFile)
"            execute 'e' escape(getreg(v:register), '|#%*\')
"        endif
"    endif
"endfun
"nnoremap gf :call BetterGF()<cr>
"nnoremap <exec> gf (v:register=='"') ? 'gf' : ':e '.getreg(v:register).'<cr>'

