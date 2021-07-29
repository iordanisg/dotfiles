local present1, lspconfig = pcall(require, 'lspconfig')
local present2, lspinstall = pcall(require, 'lspinstall')
if not (present1 or present2) then
  return
end

local function on_attach(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  -- buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  -- buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap('n', '<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'ge', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', 'gl', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap('n', 'gf', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
  end

  -- lsputils handlers
  vim.lsp.handlers['textDocument/codeAction'] = require('lsputil.codeAction').code_action_handler
  vim.lsp.handlers['textDocument/references'] = require('lsputil.locations').references_handler
  vim.lsp.handlers['textDocument/definition'] = require('lsputil.locations').definition_handler
  vim.lsp.handlers['textDocument/declaration'] = require('lsputil.locations').declaration_handler
  vim.lsp.handlers['textDocument/typeDefinition'] = require('lsputil.locations').typeDefinition_handler
  vim.lsp.handlers['textDocument/implementation'] = require('lsputil.locations').implementation_handler
  vim.lsp.handlers['textDocument/documentSymbol'] = require('lsputil.symbols').document_handler
  vim.lsp.handlers['workspace/symbol'] = require('lsputil.symbols').workspace_handler

  -- lsp_signature
  require('lsp_signature').on_attach()

  print('Attached to ' .. client.name)
end

-- Configure efm language server
local efm_settings = {
  rootMarkers = { '.git/' },
  languages = {
    go = {
      { formatCommand = 'goimports', formatStdin = true },
      { formatCommand = 'gofumpt', formatStdin = true },
    },
    lua = {
      { formatCommand = 'stylua - --config-path ~/.config/stylua/stylua.toml', formatStdin = true },
    },
    json = {
      { formatCommand = 'prettier --stdin-filepath ${INPUT}', formatStdin = true },
    },
    markdown = {
      { formatCommand = 'prettier --stdin-filepath ${INPUT}', formatStdin = true },
    },
    python = {
      { formatCommand = 'black --quiet -', formatStdin = true },
    },
    yaml = {
      { formatCommand = 'prettier --stdin-filepath ${INPUT}', formatStdin = true },
    },
  },
}

-- Configure go language server
local go_settings = {
  gopls = {
    analyses = {
      unusedparams = true,
    },
  },
  staticcheck = true,
}

-- Configure lua language server
local lua_settings = {
  Lua = {
    runtime = {
      -- LuaJIT in the case of Neovim
      version = 'LuaJIT',
      path = vim.split(package.path, ';'),
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = { 'vim' },
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
      },
    },
  },
}

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    },
  }
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach,
  }
end

-- lsp-install
local function setup_servers()
  lspinstall.setup()

  -- get all installed servers
  local servers = lspinstall.installed_servers()
  for _, server in pairs(servers) do
    local config = make_config()

    -- language specific config
    if server == 'efm' then
      config.filetypes = { 'go', 'lua', 'json', 'markdown', 'python', 'yaml' }
      config.init_options = { documentFormatting = true, codeAction = true }
      config.settings = efm_settings
    elseif server == 'lua' then
      config.settings = lua_settings
    elseif server == 'go' then
      config.settings = go_settings
    end

    lspconfig[server].setup(config)
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
lspinstall.post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd('bufdo e') -- triggers FileType autocmd that starts the server
end
