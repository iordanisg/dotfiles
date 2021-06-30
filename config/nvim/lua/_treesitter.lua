local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
  ensure_installed = {
    "bash",
    "go",
    "html",
    "json",
    "json",
    "lua",
    "python",
    "regex",
    "toml",
    "yaml",
  },
  highlight = {
    enable = true,
  },
}
