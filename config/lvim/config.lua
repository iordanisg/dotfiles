--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
vim.opt.timeoutlen = 250
vim.opt.relativenumber = true

lvim.log.level = 'warn'
lvim.format_on_save = true

vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_palette = 'original'
lvim.colorscheme = 'gruvbox-material'

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = 'space'
-- add your own keymapping
lvim.keys.normal_mode['<C-s>'] = ':w<cr>'
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }
lvim.builtin.which_key.mappings['G'] = { '<cmd>G<CR>', 'Fugitive' }
lvim.builtin.which_key.mappings['P'] = { '<cmd>Telescope projects<CR>', 'Projects' }
lvim.builtin.which_key.mappings['S'] = {
  name = 'Session',
  c = { "<cmd>lua require('persistence').load()<cr>", 'Restore last session for current dir' },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", 'Restore last session' },
  Q = { "<cmd>lua require('persistence').stop()<cr>", 'Quit without saving session' },
}
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
lvim.builtin.nvimtree.setup.view.side = 'left'
lvim.builtin.nvimtree.show_icons.git = 1

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = 'maintained'

lvim.builtin.treesitter.ignore_install = { 'haskell' }
lvim.builtin.treesitter.highlight.enabled = true

local components = require('lvim.core.lualine.components')
lvim.builtin.lualine.sections.lualine_y = { components.location }
lvim.builtin.lualine.sections.lualine_z = { components.scrollbar }

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
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

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { exe = "black", filetypes = { "python" } },
--   { exe = "isort", filetypes = { "python" } },
--   {
--     exe = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
local formatters = require('lvim.lsp.null-ls.formatters')
formatters.setup({
  { exe = 'black', filetypes = { 'python' } },
  { exe = 'stylua', filetypes = { 'lua' } },
  { exe = 'shfmt', filetypes = { 'sh' } },
  { exe = 'terraform_fmt', filetypes = { 'terraform' } },
  { exe = 'goimports', filetypes = { 'go' } },
  { exe = 'gofumpt', filetypes = { 'go' } },
})

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { exe = "flake8", filetypes = { "python" } },
--   {
--     exe = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     args = { "--severity", "warning" },
--   },
--   {
--     exe = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }
local linters = require('lvim.lsp.null-ls.linters')
linters.setup({
  { exe = 'flake8', filetypes = { 'python' } },
})

-- Additional Plugins
lvim.plugins = {
  -- colorschemes
  { 'sainnhe/gruvbox-material' },
  -- lsp
  {
    'ray-x/lsp_signature.nvim',
    event = 'BufRead',
    config = function()
      require('lsp_signature').setup()
    end,
  },
  {
    'simrat39/symbols-outline.nvim',
    cmd = 'SymbolsOutline',
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
      require('user.rnvimr')
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
      require('user.indent-blankline')
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
    config = function()
      require('todo-comments').setup()
    end,
  },
  {
    'vimwiki/vimwiki',
    config = function()
      require('user.vimwiki')
    end,
  },
  { 'google/vim-jsonnet' },
  { 'towolf/vim-helm' },
  {
    'folke/persistence.nvim',
    event = 'BufReadPre', -- this will only start session saving when an actual file was opened
    module = 'persistence',
    config = function()
      require('persistence').setup({
        dir = vim.fn.expand(vim.fn.stdpath('config') .. '/session/'),
        options = { 'buffers', 'curdir', 'tabpages', 'winsize' },
      })
    end,
  },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
