-- TODO: augroups and autocommands do not have a Lua interface yet

vim.api.nvim_exec(
[[
augroup LuaHighlight
  autocmd!
  autocmd TextYankPost * silent! lua require("vim.highlight").on_yank({timeoute = 250})
augroup END
]],
false)

vim.api.nvim_exec(
[[
augroup DIAGNOSTIC_LOCATION_LIST
  autocmd!
  autocmd! BufWrite,BufEnter,InsertLeave * lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
]],
false)

vim.api.nvim_command('autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)')
