
" This script assumes your leader sequences follow one of these two forms:
" (1) <leader> followed by a lowercase key followed by any single key
" or (2) <leader> followed by any single non-lowercase 
" With the following, if you typo a leader sequence you won't accidentally do
" something unintended. All possible leader sequences are mapped to <nop>.

fun! LeaderDummy() abort
    let char = getchar()
    if char >= 97 && char <= 122
        call getchar()
    endif
    return ""
endfun
nmap <expr> <leader> LeaderDummy()

" The following lines ensure that 
"nmap <leader>aa <Nop>
"nmap <leader>bb <Nop>
"nmap <leader>cc <Nop>
"nmap <leader>dd <Nop>
"nmap <leader>ee <Nop>
"nmap <leader>ff <Nop>
"nmap <leader>gg <Nop>
"nmap <leader>hh <Nop>
"nmap <leader>ii <Nop>
"nmap <leader>jj <Nop>
"nmap <leader>kk <Nop>
"nmap <leader>ll <Nop>
"nmap <leader>mm <Nop>
"nmap <leader>nn <Nop>
"nmap <leader>oo <Nop>
"nmap <leader>pp <Nop>
"nmap <leader>qq <Nop>
"nmap <leader>rr <Nop>
"nmap <leader>ss <Nop>
"nmap <leader>tt <Nop>
"nmap <leader>uu <Nop>
"nmap <leader>vv <Nop>
"nmap <leader>ww <Nop>
"nmap <leader>xx <Nop>
"nmap <leader>yy <Nop>
"nmap <leader>zz <Nop>
