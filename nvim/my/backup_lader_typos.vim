
" This script assumes your leader sequences follow one of these two forms:
" (1) <leader> followed by a lowercase key followed by any single key
" or (2) <leader> followed by any single non-lowercase 
" With the following, if you typo a leader sequence you won't accidentally do
" something unintended. All possible leader sequences are mapped to <nop>.

"nmap <leader>A <nop>
"nmap <leader>B <nop>
"nmap <leader>C <nop>
"nmap <leader>D <nop>
"nmap <leader>E <nop>
"nmap <leader>F <nop>
"nmap <leader>G <nop>
"nmap <leader>H <nop>
"nmap <leader>I <nop>
"nmap <leader>J <nop>
"nmap <leader>K <nop>
"nmap <leader>L <nop>
"nmap <leader>M <nop>
"nmap <leader>N <nop>
"nmap <leader>O <nop>
"nmap <leader>P <nop>
"nmap <leader>Q <nop>
"nmap <leader>R <nop>
"nmap <leader>S <nop>
"nmap <leader>T <nop>
"nmap <leader>U <nop>
"nmap <leader>V <nop>
"nmap <leader>W <nop>
"nmap <leader>X <nop>
"nmap <leader>Y <nop>
"nmap <leader>Z <nop>
"
"nmap <leader>` <nop>
"nmap <leader>~ <nop>
"nmap <leader>! <nop>
"nmap <leader>@ <nop>
"nmap <leader># <nop>
"nmap <leader>$ <nop>
"nmap <leader>% <nop>
"nmap <leader>^ <nop>
"nmap <leader>& <nop>
"nmap <leader>* <nop>
"nmap <leader>( <nop>
"nmap <leader>) <nop>
"nmap <leader>- <nop>
"nmap <leader>_ <nop>
"nmap <leader>= <nop>
"nmap <leader>+ <nop>
"nmap <leader>[ <nop>
"nmap <leader>{ <nop>
"nmap <leader>] <nop>
"nmap <leader>} <nop>
"nmap <leader>\ <nop>
"nmap <leader>\| <nop>
"nmap <leader>; <nop>
"nmap <leader>: <nop>
"nmap <leader>' <nop>
"nmap <leader>" <nop>
"nmap <leader>, <nop>
"nmap <leader>< <nop>
"nmap <leader>. <nop>
"nmap <leader>> <nop>
"nmap <leader>/ <nop>
"nmap <leader>? <nop>
"
"nmap <leader><backspace> <nop>
"nmap <leader><del> <nop>
"nmap <leader><tab> <nop>
"nmap <leader><enter> <nop>
"nmap <leader><space> <nop>
"fun! Mappings()
"    redir => maps
"    silent map
"    redir END
"    echo system(['grep', '-vi', '<nop>$'], maps)
"endfun

fun! LeaderDummy() abort
    let char_1 = getchar()
    if char_1 >= 97 && char_1 <= 122
        call getchar()
    endif
    return ""
endfun
nmap <expr> <leader> LeaderDummy()

"nmap <expr> <leader>a getchar() ? "" : ""
"nmap <expr> <leader>b getchar() ? "" : ""
"nmap <expr> <leader>c getchar() ? "" : ""
"nmap <expr> <leader>d getchar() ? "" : ""
"nmap <expr> <leader>e getchar() ? "" : ""
"nmap <expr> <leader>f getchar() ? "" : ""
"nmap <expr> <leader>g getchar() ? "" : ""
"nmap <expr> <leader>h getchar() ? "" : ""
"nmap <expr> <leader>i getchar() ? "" : ""
"nmap <expr> <leader>j getchar() ? "" : ""
"nmap <expr> <leader>k getchar() ? "" : ""
"nmap <expr> <leader>l getchar() ? "" : ""
"nmap <expr> <leader>m getchar() ? "" : ""
"nmap <expr> <leader>n getchar() ? "" : ""
"nmap <expr> <leader>o getchar() ? "" : ""
"nmap <expr> <leader>p getchar() ? "" : ""
"nmap <expr> <leader>q getchar() ? "" : ""
"nmap <expr> <leader>r getchar() ? "" : ""
"nmap <expr> <leader>s getchar() ? "" : ""
"nmap <expr> <leader>t getchar() ? "" : ""
"nmap <expr> <leader>u getchar() ? "" : ""
"nmap <expr> <leader>v getchar() ? "" : ""
"nmap <expr> <leader>w getchar() ? "" : ""
"nmap <expr> <leader>x getchar() ? "" : ""
"nmap <expr> <leader>y getchar() ? "" : ""
"nmap <expr> <leader>z getchar() ? "" : ""
