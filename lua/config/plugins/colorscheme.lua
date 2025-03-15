return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    enabled = true,
    priority = 1000,
    -- what the heck waltuh
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true,
        }
      })

      vim.cmd.colorscheme("carbonfox")
    end,
  }
}
