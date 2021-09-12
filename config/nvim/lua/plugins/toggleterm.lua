local present, terminal = pcall(require, 'toggleterm')
if not present then
  return
end

terminal.setup({
  size = 20,
  open_mapping = [[<Leader>TT]],
  persist_size = true,
  shade_terminals = true,
  start_in_insert = true,
  direction = 'float',
})

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap('n', '<leader>G', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })
