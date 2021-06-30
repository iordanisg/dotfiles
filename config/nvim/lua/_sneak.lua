local opts = {}
local command = vim.api.nvim_command

vim.api.nvim_set_var('sneak#label', 1)
vim.api.nvim_set_var('sneak#prompt', '🔎 ')
vim.api.nvim_set_var('sneak#s_next', 1)
vim.api.nvim_set_var('sneak#use_ic_scs', 1)

map('n', 'gs', '<Plug>Sneak_;', opts)
map('n', 'gS', '<Plug>Sneak_,', opts)

command('highlight Sneak guifg=Black guibg=#00C7DF ctermfg=Black ctermbg=Cyan')
