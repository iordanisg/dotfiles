local present, _ = pcall(require, 'packerInit')
local packer

if present then
  packer = require('packer')
else
  return false
end

local use = packer.use

return packer.startup(function()
  -- TODO: Verify lazy loading options (event, cmd, ft, etc)

  -- Packer
  use({
    'wbthomason/packer.nvim',
    event = 'VimEnter',
  })

  -- Terminal
  -- TODO: Figure out why errors are being thrown if this plugin is loaded after Telescope
  use({
    'akinsho/nvim-toggleterm.lua',
    event = 'BufWinEnter',
    config = function()
      require('plugins.toggleterm')
    end,
  })

  -- Bufferline
  -- TODO: Figure out why this breaks Telescope only on OSX (!)
  use({
    'akinsho/nvim-bufferline.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    after = 'gruvbox.nvim',
    config = function()
      require('bufferline').setup({})
    end,
  })

  -- Statusline
  -- TODO: Figure out why this breaks Telescope
  use({
    'ojroques/nvim-hardline',
    after = 'gruvbox.nvim',
    config = function()
      require('plugins.statusline')
    end,
  })

  -- Themes
  use({
    'npxbr/gruvbox.nvim',
    requires = { 'rktjmp/lush.nvim' },
    after = 'packer.nvim',
    config = function()
      require('theme')
    end,
  })

  use({
    'norcalli/nvim-colorizer.lua',
    event = 'BufRead',
    config = function()
      require('plugins.others').colorizer()
    end,
  })

  use({
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    config = function()
      require('plugins.treesitter')
    end,
  })

  -- TODO: add requirement
  use({
    'nvim-treesitter/nvim-treesitter-textobjects',
    event = 'BufRead',
    config = function()
      require('plugins.treesitter')
    end,
  })

  -- LSP
  use({
    'kabouzeid/nvim-lspinstall',
    event = 'BufRead',
  })

  use({
    'neovim/nvim-lspconfig',
    after = 'nvim-lspinstall',
    config = function()
      require('plugins.lspconfig')
    end,
  })

  use({
    'RishabhRD/nvim-lsputils',
    requires = { 'RishabhRD/popfix' },
    event = 'BufRead',
  })

  use({
    'ray-x/lsp_signature.nvim',
    event = 'BufRead',
  })

  -- TODO: switch to https://github.com/hrsh7th/nvim-cmp
  use({
    'hrsh7th/nvim-compe',
    event = 'InsertEnter',
    config = function()
      require('plugins.compe')
    end,
    wants = 'LuaSnip',
    requires = {
      {
        'L3MON4D3/LuaSnip',
        wants = 'friendly-snippets',
        event = 'InsertCharPre',
        config = function()
          require('plugins.luasnip')
        end,
      },
      {
        'rafamadriz/friendly-snippets',
        event = 'InsertCharPre',
      },
    },
  })

  use({
    'kyazdani42/nvim-tree.lua',
    cmd = 'NvimTreeToggle',
    config = function()
      require('plugins.nvimtree')
    end,
  })

  use({
    'kevinhwang91/rnvimr',
    cmd = 'RnvimrToggle',
  })

  use({
    'kyazdani42/nvim-web-devicons',
    after = 'gruvbox.nvim',
  })

  use({
    'nvim-lua/plenary.nvim',
    -- event = 'BufRead',
  })

  use({
    'nvim-lua/popup.nvim',
    -- after = 'plenary.nvim',
  })

  use({
    'nvim-telescope/telescope.nvim',
    config = function()
      require('plugins.telescope')
    end,
  })

  use({
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
  })
  use({
    'nvim-telescope/telescope-media-files.nvim',
  })

  use({
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    event = 'BufRead',
    config = function()
      require('plugins.gitsigns')
    end,
  })

  use({
    'windwp/nvim-autopairs',
    after = 'nvim-compe',
    config = function()
      require('plugins.autopairs')
    end,
  })

  use({
    'andymass/vim-matchup',
    event = 'CursorMoved',
  })

  use({
    'terrortylor/nvim-comment',
    cmd = 'CommentToggle',
    config = function()
      require('plugins.others').comment()
    end,
  })

  use({
    'tweekmonster/startuptime.vim',
    cmd = 'StartupTime',
  })

  -- Git
  use({
    'tpope/vim-fugitive',
    cmd = { 'Git' },
  })

  use({
    'kdheepak/lazygit.nvim',
    cmd = { '<cmd>lua _lazygit_toggle()<CR>' },
  })

  use({
    'justinmk/vim-sneak',
    event = 'BufRead',
    config = function()
      require('plugins.sneak')
    end,
  })

  use({
    'tpope/vim-unimpaired',
    event = 'BufRead',
  })

  use({
    'tpope/vim-surround',
    event = 'BufRead',
  })

  use({
    'windwp/nvim-spectre',
    event = 'BufRead',
  })

  use({
    'yamatsum/nvim-cursorline',
    event = 'BufRead',
  })

  use({
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    event = 'BufRead',
    config = function()
      require('todo-comments').setup({})
    end,
  })

  use({
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    event = 'BufRead',
    config = function()
      require('trouble').setup({})
    end,
  })

  use({
    'kevinhwang91/nvim-bqf',
    event = 'BufRead',
  })

  use({
    'rmagatti/auto-session',
    config = function()
      require('plugins.autosession')
    end,
  })

  -- TODO: is there a way to lazy load vimwiki?
  use({
    'vimwiki/vimwiki',
    config = function()
      require('plugins.vimwiki')
    end,
  })

  use({
    'pwntester/octo.nvim',
    config = function()
      require('plugins.octo')
    end,
  })
end)
