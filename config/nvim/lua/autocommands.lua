local cmd = vim.cmd
local u = require('utils')

u.create_augroup({
  { 'TextYankPost', '*', 'silent!', 'lua', 'require("vim.highlight").on_yank({timeout = 250})' },
}, 'LuaHighlight')

cmd('autocmd BufWritePre *.go lua vim.lsp.buf.formatting_seq_sync()')
cmd('autocmd BufWritePre *.json lua vim.lsp.buf.formatting_seq_sync()')
cmd('autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_seq_sync()')
cmd('autocmd BufWritePre *.md lua vim.lsp.buf.formatting_seq_sync()')
cmd('autocmd BufWritePre *.py lua vim.lsp.buf.formatting_seq_sync()')
cmd('autocmd BufWritePre *.yaml lua vim.lsp.buf.formatting_seq_sync()')
