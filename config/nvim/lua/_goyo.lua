local command = vim.api.nvim_command
local opts = { noremap = true, silent = true }

map('n', '<Leader>z', '<cmd>Goyo<CR>', opts)

command('au! User GoyoEnter Limelight')
command('au! User GoyoLeave Limelight!')
