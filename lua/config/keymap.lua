-- nvim keymap
vim.keymap.set("n", "<leader>pv", ":Oil<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>fs", vim.cmd.w)
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- harpoon keymap
local harpoon = require('harpoon')
vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<M-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<M-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<M-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<M-4>", function() harpoon:list():select(4) end)
-- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

-- telescope keymap
local tsbuiltins = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', tsbuiltins.find_files, {})
vim.keymap.set('n', '<leader>pg', tsbuiltins.git_files, {})
vim.keymap.set('n', '<leader>ps', tsbuiltins.live_grep, {})
vim.keymap.set('n', '<leader>pb', tsbuiltins.buffers, {})
vim.keymap.set('n', '<leader>ph', tsbuiltins.help_tags, {})

-- vim-tmux-navigator keymap
vim.keymap.set('n', "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>")
vim.keymap.set('n', "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>")
vim.keymap.set('n', "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>")
vim.keymap.set('n', "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>")
vim.keymap.set('n', "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>")

-- fugitive keymap
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- dap keymap
local dap = require('dap')
local ui = require("dapui")
vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dl", dap.list_breakpoints)
vim.keymap.set("n", "<leader>df", dap.clear_breakpoints)
vim.keymap.set("n", "<leader>dr", dap.restart)
vim.keymap.set("n", "<leader>dc", dap.continue)
vim.keymap.set("n", "<leader>dx", function()
  dap.terminate()
  ui.close()
end
)
vim.keymap.set("n", "<F10>", dap.step_back)
vim.keymap.set("n", "<F11>", dap.step_into)
vim.keymap.set("n", "<F12>", dap.step_over)
vim.keymap.set("n", "<F24>", dap.step_out)
