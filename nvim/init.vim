fun! s:dir_exists_linux(dir)
    let regex = a:dir . "['\"]: No such file or directory\n*$"
    return system("stat " . a:dir) !~ regex
endfun

let mapleader = "\<Space>"
let maplocalleader = "\<Space>"
source $HOME/.config/nvim/remaps/remaps.vim

" plugins
if has('nvim')
    lua require("plugins")
else
    " vim-noplugins prevents nvim-plugin keybinds from messing me up in vim
    source $HOME/.config/nvim/vim-noplugins.vim
endif

" unpublished single-file vimscript plugins
source $HOME/.config/nvim/my/leader_typos.vim

" my settings and personal remaps
source $HOME/.config/nvim/my/settings.vim
source $HOME/.config/nvim/my/remaps.vim
source $HOME/.config/nvim/my/autocmds.vim

" platform-specific overrides
if has('linux')
    source $HOME/.config/nvim/platform-linux.vim
    if s:dir_exists_linux("/data/data/com.android.phone")
        source $HOME/.config/nvim/platform-android.vim
    endif
elseif has('mac')
    source $HOME/.config/nvim/platform-macos.vim
elseif has('win32')
    source $HOME/.config/nvim/platform-windows.vim
endif
