local g = vim.g
local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- Global variables
g.python3_host_prog = '$HOME/.pyenv/versions/py3nvim/bin/python'
g.python_host_prog = '$HOME/.pyenv/versions/py2nvim/bin/python'
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.loaded_node_provider = 0
g.mapleader = ' '

-- Global options
o.backup = false -- disable backup files
o.clipboard = 'unnamed,unnamedplus' --
o.cmdheight = 2 -- increase command-line size
o.completeopt = 'menuone,noselect' -- set |ins-completion| options
o.hidden = true -- required to keep multiple buffers open
o.inccommand = 'split'
o.showmode = false -- taken care of by the status line
o.smartcase = true -- make searching smarter
o.smartindent = true -- make indenting smarter
o.splitbelow = true -- horizontal splits will automatically be below
o.splitright = true -- vertical splits will automatically be to the right
o.swapfile = false -- disable swap files
o.timeoutlen = 400
o.updatetime = 250 -- faster completion
o.wrap = false -- display long lines as just one line
o.termguicolors = true
o.number = true
o.numberwidth = 2
o.relativenumber = true -- enable line numbers relative to the current line

-- Window options
wo.colorcolumn = '80' -- add a highlighted column at 80 characters
wo.cursorline = true -- highlight cursor line

-- Buffer options
bo.expandtab = true -- converts tabs to spaces

-- disable builtin vim plugins
local disabled_built_ins = {
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'gzip',
  'zip',
  'zipPlugin',
  'tar',
  'tarPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  '2html_plugin',
  'logipat',
  'rrhelper',
  'spellfile_plugin',
  'matchit',
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g['loaded_' .. plugin] = 1
end
