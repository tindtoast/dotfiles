-- plug plug plug in
vim.cmd([[call plug#begin()

Plug 'Mofiqul/dracula.nvim'
Plug 'dense-analysis/ale'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'numToStr/Comment.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nikvdp/neomux'
Plug 'lukas-reineke/indent-blankline.nvim'

call plug#end()]])

-- autostart COQ
vim.g.coq_settings = { ["auto_start"] = 'shut-up' }

-- setup comment & indent-blankline
require('Comment').setup()
require('ibl').setup()

-- set colorscheme to dracula
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

-- dont show vim mode
vim.opt.showmode = false

-- make tab into 4 spaces, 8 too much
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- lualine config
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
