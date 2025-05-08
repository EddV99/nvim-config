return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    lazy = false,
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "rust_analyzer", "clangd", "pyright" },
        automatic_installation = false,
        handlers = nil,
      })

      vim.keymap.set("n", "ge", function()
        vim.diagnostic.open_float()
      end)

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client:supports_method('textDocument/rename') then
            vim.keymap.set("n", "<F2>", function()
              vim.lsp.buf.rename(nil)
            end)
          end

          if client:supports_method('textDocument/references') then
            vim.keymap.set("n", "gr", function()
              vim.lsp.buf.references()
            end)
          end

          if client:supports_method('textDocument/codeAction') then
            vim.keymap.set("n", "<F1>", function()
              vim.lsp.buf.code_action()
            end)
          end

          if client:supports_method('textDocument/documentSymbol') then
            vim.keymap.set("n", "<F4>", function()
              vim.lsp.buf.document_symbol()
            end)
          end

          if client:supports_method('textDocument/definition') then
            vim.keymap.set("n", "gd", function()
              vim.lsp.buf.definition()
            end)
          end

          if client:supports_method('textDocument/formatting') then
            vim.keymap.set("n", "<F3>", function()
              vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf(), id = client.id })
            end)
            -- vim.api.nvim_create_autocmd("BufWritePre", {
            --   buffer = args.buf,
            --   callback = function()
            --     vim.lsp.buf.format({ async = true, bufnr = args.buf, id = client.id })
            --   end,
            -- })
          end
        end,
      })
    end,
  }
}
