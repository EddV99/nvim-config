vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' }
})

local treesitter = require("nvim-treesitter")

treesitter.install({ "c", "cpp", "lua", "vim", "vimdoc", "go", "markdown"})
