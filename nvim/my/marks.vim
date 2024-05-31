
" return all global marks
fun! GlobalMarks() abort
    redir => str
    :silent marks ABCDEFGHIJKLMNOPQRSTUVWXYZ
    redir END
    return str
endfun
