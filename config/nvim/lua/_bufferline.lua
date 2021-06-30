vim.g.bufferline = {
  auto_hide = true,
  closable = false,
  clickable = false,
  maximum_padding = 1,
}

local opts = { noremap = true, silent = true }

map('n', '<Leader>bb', '<cmd>BufferPick<CR>', opts)
map('n', '<Leader>bc', '<cmd>BufferClose<CR>', opts)
map('n', '<Leader>bo', '<cmd>BufferOrderByLanguage<CR>', opts)
