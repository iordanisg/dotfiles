vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use { 'wbthomason/packer.nvim', opt = true }

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'steelsojka/completion-buffers'
  use 'RishabhRD/popfix'
  use 'RishabhRD/nvim-lsputils'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = 'vim.cmd [[TSUpdate]]'
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    }
  }

  -- File managers
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    }
  }

  -- Tabline
  use 'romgrk/barbar.nvim'

  -- Git
  use 'junegunn/gv.vim'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    }
  }
  use 'tpope/vim-fugitive'

  -- Moving around
  use 'christoomey/vim-tmux-navigator'
  use 'justinmk/vim-sneak'
  use 'unblevable/quick-scope'

  -- Searching
  use 'brooth/far.vim'
  use 'junegunn/fzf.vim'
  use {
    'junegunn/fzf',
    run = './install --bin'
  }

  -- Optimization
  use 'tweekmonster/startuptime.vim'

  -- Fancy stuff
  use 'RRethy/vim-illuminate'
  use 'liuchengxu/vim-which-key'
  use 'mhinz/vim-startify'
  use 'norcalli/nvim-colorizer.lua'

  -- Making life easier
  use 'jiangmiao/auto-pairs'
  use 'tversteeg/registers.nvim'
  use 'ntpeters/vim-better-whitespace'
  use 'romainl/vim-qf'
  use 'tpope/vim-commentary'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'

  -- Status line
  use 'glepnir/galaxyline.nvim'

  -- Wiki
  use 'vimwiki/vimwiki'

  -- Zen
  use 'dhruvasagar/vim-zoom'
  use 'junegunn/goyo.vim'
  use 'junegunn/limelight.vim'

  -- Themes
  use 'gruvbox-community/gruvbox'
  use 'arcticicestudio/nord-vim'
  use 'lifepillar/vim-solarized8'

  -- Snippets
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'

  -- Terminal
  use 'akinsho/nvim-toggleterm.lua'

  -- TODO
  -- use 'bfrg/vim-qf-preview'
  -- use 'justinmk/vim-dirvish'
  -- use 'mtth/scratch.vim'
  -- use 'nikvdp/neomux'
  -- use 'preservim/nerdcommenter'
  -- use 'pwntester/octo.nvim'
  -- use 'rstacruz/vim-closer'
  -- use 'tpope/vim-dispath'
  use 'tpope/vim-sleuth'
end)
