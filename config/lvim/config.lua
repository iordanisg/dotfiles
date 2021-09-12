--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = 'warn'
lvim.format_on_save = true
vim.g.gruvbox_contrast_dark = 'hard'
lvim.colorscheme = 'gruvbox'

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = 'space'
-- add your own keymapping
lvim.keys.normal_mode['<C-s>'] = ':w<cr>'
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- lvim.builtin.telescope.on_config_done = function()
--   local actions = require "telescope.actions"
--   -- for input mode
--   lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
--   lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
--   -- for normal mode
--   lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
-- end

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings['P'] = { '<cmd>Telescope projects<CR>', 'Projects' }
lvim.builtin.which_key.mappings['r'] = { '<cmd>RnvimrToggle<CR>', 'Ranger' }
lvim.builtin.which_key.mappings['t'] = {
  name = '+Trouble',
  r = { '<cmd>Trouble lsp_references<cr>', 'References' },
  f = { '<cmd>Trouble lsp_definitions<cr>', 'Definitions' },
  d = { '<cmd>Trouble lsp_document_diagnostics<cr>', 'Diagnosticss' },
  q = { '<cmd>Trouble quickfix<cr>', 'QuickFix' },
  l = { '<cmd>Trouble loclist<cr>', 'LocationList' },
  w = { '<cmd>Trouble lsp_workspace_diagnostics<cr>', 'Diagnosticss' },
}
lvim.builtin.which_key.mappings['gG'] = { '<cmd>G<CR>', 'Fugitive' }
lvim.builtin.which_key.mappings['sT'] = { '<cmd>Telescope grep_string<CR>', 'Grep string' }
lvim.builtin.which_key.mappings['ss'] = { "<cmd>lua require('spectre').open()<CR>", 'Spectre' }
lvim.builtin.which_key.mappings['sS'] = {
  "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
  'Spectre current word',
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = 'left'
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = 'maintained'
lvim.builtin.treesitter.ignore_install = { 'haskell' }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end
lvim.lsp.diagnostics.virtual_text = false

-- set a formatter if you want to override the default lsp one (if it exists)
lvim.lang.go.formatters = {
  { exe = 'goimports' },
  { exe = 'gofumpt' },
}
lvim.lang.python.formatters = {
  { exe = 'black' },
}
lvim.lang.lua.formatters = {
  { exe = 'stylua' },
}
lvim.lang.sh.formatters = {
  { exe = 'shfmt' },
}
-- set an additional linter
lvim.lang.python.linters = {
  { exe = 'flake8' },
}

-- Additional Plugins
lvim.plugins = {
  -- colorschemes
  {
    'ellisonleao/gruvbox.nvim',
    requires = { 'rktjmp/lush.nvim' },
  },
  {
    'shaunsingh/nord.nvim',
  },
  -- lsp
  {
    'ray-x/lsp_signature.nvim',
    event = 'InsertEnter',
    config = function()
      require('lsp_signature').setup()
    end,
  },
  {
    'folke/trouble.nvim',
    cmd = 'TroubleToggle',
  },
  -- git
  {
    'tpope/vim-fugitive',
    cmd = {
      'G',
      'Git',
      'Gdiffsplit',
      'Gread',
      'Gwrite',
      'Ggrep',
      'GMove',
      'GDelete',
      'GBrowse',
      'GRemove',
      'GRename',
      'Glgrep',
      'Gedit',
    },
    ft = { 'fugitive' },
  },
  {
    'sindrets/diffview.nvim',
    event = 'BufRead',
  },
  {
    'pwntester/octo.nvim',
    event = 'BufRead',
    config = function()
      require('plugins.octo')
    end,
  },
  -- navigation
  {
    'kevinhwang91/nvim-bqf',
    event = { 'BufRead', 'BufNew' },
  },
  {
    'windwp/nvim-spectre',
    event = 'BufRead',
  },
  {
    'kevinhwang91/rnvimr',
    cmd = 'RnvimrToggle',
    config = function()
      require('plugins.rnvimr')
    end,
  },
  -- general
  {
    'tpope/vim-surround',
    keys = { 'c', 'd', 'y' },
  },
  {
    'tpope/vim-repeat',
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    setup = function()
      require('plugins.indent-blankline')
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    ft = 'markdown',
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  {
    'folke/todo-comments.nvim',
    event = 'BufRead',
  },
  {
    'vimwiki/vimwiki',
    config = function()
      require('plugins.vimwiki')
    end,
  },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
