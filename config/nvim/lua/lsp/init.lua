require('lsp._handlers')
require('lsp._diagnostic')

local lsp = require('lspconfig')
local completion = require('completion')
local util = require('lspconfig.util')

local function custom_on_attach(client)
	completion.on_attach(client)
        require('lsp._mappings')

	print('Attached to ' .. client.name)
end

-- Can be extended to include things like capabilities, etc
local default_lsp_config = { on_attach = custom_on_attach }

local servers = {
  bashls = {},
  dockerls = {},
  gopls = {},
  -- html = {},
  -- jsonls = {},
  pyright = {},
  -- terraformls = {},
  vimls = {},
  -- yamlls = {},
  sumneko_lua = {
    cmd = {"/usr/bin/lua-language-server", "-E", "/usr/share/lua-language-server/main.lua" .. "/main.lua"};
    root_dir = function(fname)
      return util.find_git_ancestor(fname) or
        util.path.dirname(fname)
    end,
    settings = {
      Lua = {
        runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
        diagnostics = {
          globals = {
            'vim',
            'use',
            'map',
          }
        },
        workspace = {
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          }
        }
      }
    },
  }
}

for server, config in pairs(servers) do
  lsp[server].setup(vim.tbl_deep_extend("force", default_lsp_config, config))
end

-- TODO: Terraform test
-- require'lspconfig'.terraformls.setup{}
