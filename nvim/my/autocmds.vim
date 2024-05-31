if has('nvim')
    aug HighlightYank
        au!
        au TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false}
    aug END
end

if v:version >= 700
    augroup CursorLine
      au!
      au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
      au WinLeave * setlocal nocursorline
    augroup END
end
