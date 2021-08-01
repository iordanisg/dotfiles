local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

-- Toggle relative numbers
map('n', '<Leader>n', '<cmd>set relativenumber!<CR>', opt)

-- Toggle folds
map('n', '<Leader>F', '<cmd>set foldenable!<CR>')

-- Close buffers faster
map('n', '<Leader>q', '<C-w>q', opt)

-- Better indenting
map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)

-- Save faster
map('n', '<C-s>', ':w <CR>', opt)

-- Use ESC to turn off search highlighting
map('n', '<Esc>', ':noh<CR>', opt)

-- nvim-spectre
map('n', '<Leader>S', '<cmd>lua require("spectre").open()<CR>', { noremap = true })
map('n', '<Leader>s', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', { noremap = true })
map('v', '<Leader>s', '<cmd>lua require("spectre").open_visual()<CR>', { noremap = true })

-- nvim-comment
map('n', '<Leader>/', ':CommentToggle<CR>', opt)
map('v', '<Leader>/', ':CommentToggle<CR>', opt)

-- nvim-compe
map('i', '<Tab>', 'v:lua.tab_complete()', { expr = true })
map('s', '<Tab>', 'v:lua.tab_complete()', { expr = true })
map('i', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
map('s', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
map('i', '<CR>', 'v:lua.completions()', { expr = true })

-- nvim-tree
map('n', '<Leader>e', ':NvimTreeToggle<CR>', opt)

-- telescope
map('n', '<Leader>ff', '<cmd>Telescope find_files <CR>', opt)
map('n', '<Leader>fF', '<cmd>Telescope oldfiles<CR>', opt)
map('n', '<Leader>fC', '<cmd>Telescope command_history<CR>', opt)
map('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>', opt)
map('n', '<Leader>fG', '<cmd>Telescope grep_string<CR>', opt)
map('n', '<Leader>fm', '<cmd>Telescope marks<CR>', opt)
map('n', '<Leader>gs', '<cmd>Telescope git_status <CR>', opt)
map('n', '<Leader>gc', '<cmd>Telescope git_commits <CR>', opt)
map('n', '<Leader>fp', '<cmd>Telescope media_files <CR>', opt)
map('n', '<Leader>fb', '<cmd>Telescope buffers<CR>', opt)
map('n', '<Leader>fh', '<cmd>Telescope help_tags<CR>', opt)
map('n', '<Leader>lr', '<cmd>Telescope lsp_references<CR>', opt)

-- TODO: do I need these mappings?
-- bufferline tab stuff
map('n', '<S-t>', ':enew<CR>', opt) -- new buffer
map('n', '<C-t>b', ':tabnew<CR>', opt) -- new tab
map('n', '<S-x>', ':bd!<CR>', opt) -- close tab

-- nvim-bufferline
map('n', '<TAB>', ':BufferLineCycleNext<CR>', opt)
map('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', opt)

-- vim-fugitive
map('n', '<Leader>g', ':Git<CR>', opt)

-- trouble.nvim
map('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { silent = true, noremap = true })
map('n', '<leader>xw', '<cmd>Trouble lsp_workspace_diagnostics<cr>', { silent = true, noremap = true })
map('n', '<leader>xd', '<cmd>Trouble lsp_document_diagnostics<cr>', { silent = true, noremap = true })
map('n', '<leader>xl', '<cmd>Trouble loclist<cr>', { silent = true, noremap = true })
map('n', '<leader>xq', '<cmd>Trouble quickfix<cr>', { silent = true, noremap = true })
map('n', '<leader>xr', '<cmd>Trouble lsp_references<cr>', { silent = true, noremap = true })

-- todo-comments.nvim
map('n', '<Leader>tx', '<cmd>TodoTrouble<CR>', opt)
map('n', '<Leader>tq', '<cmd>TodoQuickFix<CR>', opt)
map('n', '<Leader>tt', '<cmd>TodoTelescope<CR>', opt)

-- Packer commands till because we are not loading it at startup
vim.cmd("silent! command PackerCompile lua require 'pluginList' require('packer').compile()")
vim.cmd("silent! command PackerInstall lua require 'pluginList' require('packer').install()")
vim.cmd("silent! command PackerStatus lua require 'pluginList' require('packer').status()")
vim.cmd("silent! command PackerSync lua require 'pluginList' require('packer').sync()")
vim.cmd("silent! command PackerUpdate lua require 'pluginList' require('packer').update()")
