vim.pack.add({ 'https://github.com/mason-org/mason.nvim' })

local mason = require('mason')
mason.setup()

local registry = require('mason-registry')

local to_install = { 'gopls', 'lua-language-server', 'delve'}

for _, package_name in ipairs(to_install) do
  if not registry.is_installed(package_name) then
    local package = registry.get_package(package_name)
    package:install()
  end
end
