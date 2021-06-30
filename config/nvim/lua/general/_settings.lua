local g = vim.g
local o = vim.o
local wo = vim.wo

-- Neovim
g.python3_host_prog = "$HOME/.pyenv/versions/py3nvim/bin/python"
g.python_host_prog = "$HOME/.pyenv/versions/py2nvim/bin/python"
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.loaded_node_provider = 0

-- Global Variables
g.mapleader = " "

-- Global Options
o.backup = false                            -- disable backup files
o.clipboard = "unnamed,unnamedplus"         --
o.cmdheight = 2                             -- increase command-line size
o.completeopt = "menuone,noinsert,noselect" -- set |ins-completion| options
o.expandtab = true                          -- converts tabs to spaces
o.hidden = true                             -- required to keep multiple buffers open
o.inccommand = 'split'
o.shortmess = vim.o.shortmess .. "c"        -- don't pass messages to |ins-completion-menu|
o.showmode = false                          -- taken care of by the status line
o.smartcase = true                          -- make searching smarter
o.smartindent = true                        -- make indenting smarter
o.splitbelow = true                         -- horizontal splits will automatically be below
o.splitright = true                         -- vertical splits will automatically be to the right
o.swapfile = false                          -- disable swap files
o.timeoutlen = 300
o.updatetime = 250                          -- faster completion
o.wrap = false                              -- display long lines as just one line

-- Window Options
wo.colorcolumn = "80"                       -- add a highlighted column at 80 characters
wo.cursorline = true                        -- highlight cursor line
wo.relativenumber = true                    -- enable line numbers relative to the current line
