vim.g.completion_enable_snippet = 'UltiSnips'
vim.g.completion_auto_change_source = 1
vim.g.completion_confirm_key = '<C-y>'
vim.g.completion_matching_strategy_list = { "exact", "substring", "fuzzy" }
vim.g.completion_chain_complete_list = {
  default = {
    { complete_items = { "lsp" } },
    { complete_items = { "snippet" } },
    { complete_items = { "buffers" } },
    { mode = "<c-p>" },
    { mode = "<c-n>" }
  },
}

map('i', '<C-j>', [[<Plug>(completion_next_source)]], {})
map('i', '<C-k>', [[<Plug>(completion_prev_source)]], {})
