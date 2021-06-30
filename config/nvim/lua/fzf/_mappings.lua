local opts = { noremap = true, silent = true }

map('n', '<Leader>fS', '<cmd>History/<CR>', opts)
map('n', '<Leader>fC', '<cmd>History:<CR>', opts)
map('n', '<Leader>fr', '<cmd>Rg<CR>', opts)
map('n', '<Leader>fw', ':Rg <C-R><C-W><CR>', opts)
