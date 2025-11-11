vim.pack.add({
  { src = 'https://github.com/leoluz/nvim-dap-go' },
  { src = 'https://github.com/rcarriga/nvim-dap-ui' },
  { src = 'https://github.com/theHamsta/nvim-dap-virtual-text' },
  { src = 'https://github.com/nvim-neotest/nvim-nio' },
  { src = 'https://github.com/mfussenegger/nvim-dap' },
})

local dap = require("dap")
local ui = require("dapui")

------ UI Setup ------
ui.setup({
  layouts = { {
    elements = { {
      id = "scopes",
      size = 1.0
    }, },
    position = "left",
    size = 40
  }, {
    elements = { {
      id = "repl",
      size = 0.5
    }, {
      id = "console",
      size = 0.5
    } },
    position = "bottom",
    size = 10
  } },
})

---@diagnostic disable-next-line: missing-fields
require("nvim-dap-virtual-text").setup({
  enabled = true,
  enabled_commands = true,
  highlight_changed_variables = true,
  highlight_new_as_changed = false,
  show_stop_reason = true,
  commented = false,
  only_first_definition = true,
  all_references = false,
  clear_on_continue = false,
  display_callback = function(variable, buf, stackframe, node, options)
    -- by default, strip out new line characters
    if options.virt_text_pos == 'inline' then
      return ' = ' .. variable.value:gsub("%s+", " ")
    else
      return variable.name .. ' = ' .. variable.value:gsub("%s+", " ")
    end
  end,
  virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',
  -- experimental features:
  all_frames = false,     -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
  virt_lines = false,     -- show virtual lines instead of virtual text (will flicker!)
  virt_text_win_col = nil -- position the virtual text at a fixed window column (starting from the first text column) ,
  -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
})

-- automatically open dap ui on debugger launch
dap.listeners.before.attach.dapui_config = function()
  ui.open()
end
dap.listeners.before.launch.dapui_config = function()
  ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  ui.close()
end

local data_path = vim.fn.stdpath('data')

------ Dap Setup ------
dap.adapters.codelldb = {
  type = 'executable',
  command =
      data_path .. "/mason/bin/codelldb",
  -- On windows you may have to uncomment this:
  -- detached = false,
}

dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    -- 💀 Make sure to update this path to point to your installation
    args = {
      data_path .. "/mason/bin/dapDebugServer.js",
      "${port}"
    },
  }
}

require('dap-go').setup()

------ per language setup ------
--- javascript
dap.configurations.javascript = {
  {
    name = 'Launch Selected File',
    type = 'pwa-node',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd(), 'file')
    end,
    cwd = '${workspaceFolder}',
  },
  {
    name = "Launch Current File",
    type = "pwa-node",
    request = "launch",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
}
--- cpp
dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}

--- c
dap.configurations.c = {
  {
    name = 'Launch',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}
