local opts = {}

vim.g.vimwiki_list = {
  {
    path = '~/vimwiki/personal',
    name = 'personal',
    automatic_nested_syntaxes = 1,
  },
  {
    path = '~/vimwiki/work_new',
    name = 'work_new',
    automatic_nested_syntaxes = 1,
  },
  {
    path = '~/vimwiki/work',
    name = 'work',
    syntax = 'markdown',
    ext = '.md',
    automatic_nested_syntaxes = 1,
  },
}

vim.g.vimwiki_hl_headers = 1
vim.g.vimwiki_hl_cb_checked = 1
vim.g.vimwiki_table_mappings = 0
vim.g.vimwiki_table_mappings = 0
vim.g.vimwiki_table_auto_fmt = 0
vim.g.vimwiki_global_ext = 0

vim.api.nvim_set_keymap('n', '<Leader>we', '<Plug>VimwikiSplitLink', opts)
vim.api.nvim_set_keymap('n', '<Leader>wq', '<Plug>VimwikiVSplitLink', opts)
