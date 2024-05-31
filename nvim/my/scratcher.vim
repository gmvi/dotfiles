
" needed to re-focus a scratchpad
set switchbuf +=useopen

function! ScratchPad(mods, name)
    " Using a try here so the setlocal line never runs in a normal buffer
    try
        if a:name == "*"
            exec a:mods "new"
        else
            let name = fnameescape(a:name)
            if name == ""
                let name = "Scratch"
            endif
            " need to use try here because if the user sets switchbuf without
            " useopen or usetab, sbuffer will fail
            try
                exec a:mods "sbuffer \\[" . name . "]"
            catch
                exec a:mods "new +file \\[" . name . "]"
            endtry
        endif
        setlocal nobuflisted buftype=nofile bufhidden=delete noswapfile
    endtry
endfunction
command! -nargs=* Scratch call ScratchPad(<q-mods>, <q-args>)
