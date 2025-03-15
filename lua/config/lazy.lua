-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

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

-- Four spaces instead of 8 width tab
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
vim.opt.updatetime = 50

--Color column
vim.opt.colorcolumn = "120"

-- System Clipboard
vim.api.nvim_set_option("clipboard", "unnamed")

-- Keys 
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>fs", vim.cmd.w)
vim.keymap.set("x", "<leader>p", "\"_dP")


-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "config.plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "carbonfox" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
