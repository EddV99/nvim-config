-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.

-- Leader Keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Cursor
vim.opt.guicursor = "n-v-c-i:block"

-- Relative Line Numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Two spaces instead of 8 width tab
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
-- Smart indentation
vim.opt.smartindent = true

-- Wrap text
vim.opt.wrap = true
vim.opt.textwidth = 120

-- Searching
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Better colors
vim.opt.termguicolors = true

--Scroll off limit
vim.opt.scrolloff = 8

-- Update time
vim.opt.updatetime = 250

--Color column
vim.opt.colorcolumn = "120"

-- System Clipboard
vim.api.nvim_set_option_value("clipboard", "unnamed", {})

-- Keys
vim.keymap.set("n", "<leader>pv", ":Oil<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>fs", vim.cmd.w)
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

require("config.lazy")
