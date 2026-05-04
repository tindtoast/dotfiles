-- plug plug plug in
vim.cmd([[call plug#begin()

Plug 'Mofiqul/dracula.nvim'
Plug 'dense-analysis/ale'

call plug#end()]])

vim.cmd[[colorscheme dracula]]

-- enable line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- add line and column line at cursor
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- related to above, modify line appearance when in insert mode
vim.cmd([[au InsertLeave * hi CursorLine gui=none cterm=none guibg=Grey20]])
vim.cmd([[au InsertEnter * hi CursorColumn gui=none cterm=none guibg=transparent]])
vim.cmd([[au InsertLeave * hi CursorColumn gui=none cterm=none guibg=Grey20]])

-- only search case-sensitive if search contains UPPERCASE characters
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- let yank register sync with system clipboard
vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }

-- "x" and change operations won't affect clipboard
vim.keymap.set("", "x", "\"_x", { noremap = true})
vim.keymap.set("", "c", "\"_c", { noremap = true})

-- bind redo
vim.keymap.set("", "U", "<C-r>", { noremap = true})

-- only break lines at whitespace, don't break in the middle of words
vim.opt.linebreak = true

-- keep cursor from scrolling to edge of screen
vim.opt.scrolloff = 5

