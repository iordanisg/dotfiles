local opts = { noremap = true }

-- Close buffers faster
map('n', '<Leader>q', '<C-w>q', opts)

-- Better indenting
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- Remove highlighting by pressing Escape twice
map('n', '<Esc><Esc>', '<cmd>nohlsearch<CR>', opts)

-- Get help for the word under the cursor
map('n', '<Leader>gH', ':h <C-R><C-W><CR>', opts)

opts.silent = true

-- Use alt/opton + hjkl to resize windows
map('n', '<M-j>', '<cmd>resize +2<CR>', opts)
map('n', '<M-k>', '<cmd>resize -2<CR>', opts)
map('n', '<M-h>', '<cmd>vertical resize +2<CR>', opts)
map('n', '<M-l>', '<cmd>vertical resize -2<CR>', opts)
