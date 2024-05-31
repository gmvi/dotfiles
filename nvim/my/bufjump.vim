fun! BufJumpPrev() abort
    let [jump_list, pos] = getjumplist()
    if len(jump_list) == 0
        return
    endif
    let bufrn = jump_list[pos].bufnr
    let i = pos
    while i > 0
        let i = i-1
        if jump_list[i].bufnr != jump_list[pos].bufnr
            " jump backward (^O) N times
            return
        endif
    endwhile
endfun

fun! BufJumpNext() abort
    let [jump_list, pos] = getjumplist()
    if len(jump_list) == 0
        return
    endif
    let bufrn = jump_list[pos].bufnr
    let i = pos
    while i < len(jump_list)
        let i = i+1
        if jump_list[i].bufnr != jump_list[pos].bufnr
            " jump forward (^I) N times
            return
        endif
    endwhile
endfun


