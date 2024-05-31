""" Insert/Command mode ctrl keys more like readline emacs mode
" ctrl-k is not supported because vim uses it for digraphs and also I don't
" know how to support it in command mode
fun! I_eol()
    " Check for EOL cursor position from insert mode with <expr> or <Cmd>
    return col(".") == strlen(getline("."))+1
endfun
" TODO: should any of these be lmaps?
noremap! <C-A> <Home>
noremap! <C-B> <Left>
noremap! <C-D> <Del>
noremap! <C-E> <End>
"TODO <C-D>/<C-E>/<C-Y> for completion cycling doesn't make sense
"   see below
"   note: use up/down in command mode
noremap! <C-F> <Right>
inoremap <C-N> <Down>
inoremap <C-P> <Up>
" add <c-u> to complement <c-w>
inoremap <expr> <C-U> I_eol() ? "<c-o>cc" : "<c-o>d^"
" manual <c-w> if needed
"inoremap <expr> <C-W> I_eol() ? "<c-o>ciw": "<c-o>db"
" <c-k> is used for digraphs in vim, so use <c-o>D instead

" Ctrl-left/-right/-del/-bs
inoremap <c-left> <c-o>B
inoremap <c-right> <c-o>W
inoremap <expr> <c-del> I_eol() ? "<del>" : "<c-o>de"
"inoremap <c-bs> <c-w>
" Note about <c-bs>: Terminal emulators may not send <c-bs>, you may need to
" map it to an ANSI CSI for an unused control key.
" What I do in windows terminal is map <bs> to <c-h> and <c-bs> to <c-?>
" and then map <c-?> to <c-w> in vim
"imap <c-?> <c-w>

" TODO
" In an autocomplete list, use <c-e>/<End> to select and <c-d>/<Del> to cancel
" This is the opposite of normal vim.
" In command and insert mode, map <c-d> to <c-e> only when autocomplete is visible.
"noremap! <expr> <c-d> pumvisible() ? '<c-e>' : '<Del>'
" In insert mode, map <c-e> to <c-d> only when autocomplete is visible
"inoremap <expr> <c-e> pumvisible() ? '<c-d>' : '<End>'
" In command mode autocomplete, <end> is the closest we can get for <c-e>.
" This works well enough because we only autocomplete from EOL.
"cnoremap <c-e> <End>
" Re-map clobbered i-mode c-n/c-p
"noremap! <expr> <c-y> pumvisible() ? '<c-y>' : '<c-n>'
