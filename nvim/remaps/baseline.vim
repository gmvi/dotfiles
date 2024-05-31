""" Turn some keys off
" move K and Q into g because it'sprimerealestate
" S and X are also primerealestate
nmap K <Nop>
xmap K <Nop>
nnoremap gK K
xnoremap gK K
nmap Q <Nop>
nnoremap gQ Q
" redundant: use cl and cc for s and S
nmap s <Nop>
xmap s <Nop>
nmap S <Nop>
xmap S <Nop>
" redundant: use dl and dh for x and X
" WARNING: the following lines are untested. x is commonly used in mappings,
" and if your mappings use x without -noremap, these lines will break them
"nmap x <Nop>
"xmap x <Nop>
nmap X <Nop>
xmap X <Nop>
" No one likes Select mode (use ctrl-g from visual if needed)
nmap gh <Nop>
xmap gh <Nop>
nmap gH <Nop>
xmap gH <Nop>
nmap g<C-H> <Nop>
xmap g<C-H> <Nop>
" Disable ^G from insert because I use ^; to send <Esc> in my terminal and
" sometimes I mistype ^' which sends ^G and then I need to press <Esc> twice
imap <C-G> <Nop>
