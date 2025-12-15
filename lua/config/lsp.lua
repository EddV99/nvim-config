-- use nvim's built-in lsp support to enable lsps here
local lsps = { 'lua_ls', 'gopls', 'ts_ls', 'clangd' }

for _, lsp in ipairs(lsps) do
  vim.lsp.enable(lsp)
end

local capabilities = require('blink.cmp').get_lsp_capabilities()
vim.lsp.config('*', {
  capabilities = capabilities
})

-- setup keymapping if lsp supports actions
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
      local function on_list(options)
        vim.fn.setqflist({}, ' ', options)
        vim.cmd.cfirst()
      end
      vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition({ on_list = on_list })
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
    if client:supports_method('textDocument/completion') then
      vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
})

-- lsp diagnostic config
vim.diagnostic.config({
  virtual_text = {
    current_line = true,
  },
})
