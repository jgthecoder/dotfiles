-- https://www.shortcutfoo.com/blog/top-50-vim-configuration-options

local set = vim.opt
local setg = vim.g

-- Netrw settings
setg.netrw_banner = 0
setg.netrw_mouse = 2
setg.loaded_netrwPlugin = 1
setg.loaded_netrw = 1

-- Indentation
set.autoindent = true
set.expandtab = true
vim.cmd [[ filetype indent on ]]
set.shiftround = true
set.shiftwidth = 4
set.smarttab = true
set.tabstop = 4

-- Search
set.hlsearch = false
set.ignorecase = true
set.incsearch = true
set.smartcase = true

-- Performance
set.complete:remove "i"
set.lazyredraw = true
set.updatetime = 250
set.timeoutlen = 300

-- Text rendering
set.display:append "lastline"
set.encoding = "utf-8"
set.linebreak = true
set.scrolloff = 999
set.sidescrolloff = 9
vim.cmd [[ syntax on ]]
set.wrap = false
set.listchars = { eol = "↲", tab = "» ", trail = "·", nbsp = "␣" }
set.fillchars = { eob = " " }
set.list = true

-- UI
set.laststatus = 2
set.ruler = true
set.wildmenu = true
set.tabpagemax = 50
set.cursorline = true
set.number = true
set.relativenumber = true
set.termguicolors = true
set.errorbells = false
set.visualbell = true
set.mouse = "a"
set.title = true
set.background = "dark"
set.signcolumn = "yes"
set.showmode = false
set.winborder = "rounded"

-- Code Folding
set.foldmethod = "indent"
set.foldnestmax = 3
set.foldenable = false

-- Miscellaneous
set.clipboard = "unnamedplus"
set.autoread = true
set.backspace = "indent,eol,start"
set.confirm = true
set.formatoptions:append "j"
set.hidden = true
set.splitbelow = true
set.splitright = true
set.modeline = false
set.history = 1000
set.swapfile = false
-- set.virtualedit = 'all'
set.nrformats:remove "octal"
set.spell = true
set.wildignore:append ".pyc,.swp"
set.completeopt:append "noselect"

-- Make floating windows transparent (0 = opaque, 100 = fully transparent)
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal", blend = 20 })
vim.api.nvim_set_hl(0, "FloatBorder", { link = "NormalFloat", blend = 20 })
