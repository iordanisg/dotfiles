local opts = { noremap = true, silent = true }

map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
map('n', '<Leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gR', '<cmd>lua require(\'telescope.builtin\').lsp_references()<CR>', opts)
map('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)

-- Use <Tab> and <S-Tab> to navigate through popup menu
map('i', '<Tab>', [[ pumvisible() ? "\<C-n>" : "\<Tab>" ]], { expr = true })
map('i', '<S-Tab>', [[ pumvisible() ? "\<C-p>" : "\<S-Tab>" ]], { expr = true })
