" find files/buffers by filename
nnoremap b <cmd>Telescope buffers<cr>
nnoremap f <cmd>Telescope find_files<cr>
nnoremap g <cmd>Telescope git_files<cr>
nnoremap . <cmd>Telescope oldfiles<cr>
nnoremap c <cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') })<cr>

" find files by contents
nnoremap p <cmd>Telescope live_grep<cr>
nnoremap s <cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("2-stage Grep > ") })<cr>
nnoremap w <cmd>Telescope grep_string<cr>
nnoremap W <cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cWORD>") })<cr>

" search other things
nnoremap h <cmd>Telescope help_tags<cr>
nnoremap t <cmd>Telescope builtin<cr>
nnoremap r <cmd>Telescope registers<cr>
nnoremap d <cmd>Telescope diagnostics<cr>
