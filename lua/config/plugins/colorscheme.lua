return {
  {
    'kepano/flexoki-neovim',
    name = 'flexoki',
    lazy = false,
    enabled = true,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("flexoki-dark")
    end,
  }
}
