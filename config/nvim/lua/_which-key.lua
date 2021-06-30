local opts = { noremap = true }

vim.g.which_key_map = {}
vim.g.which_key_use_floating_win = 0

map('n', '<Leader>', '<cmd>WhichKey "<Space>"<CR>', opts)

vim.g.which_key_map = {
  b = {
    name = '+bufferline',
    b = 'pick',
    c = 'close',
    o = 'order',
  },
  e = { 'NvimTreeToggle', 'file manager' },
  f = {
    name = '+find',
    b = 'buffers',
    C = 'command history',
    f = 'files',
    F = 'file history',
    g = 'live grep',
    G = 'grep string',
    h = 'help tags',
    m = 'marks',
    r = 'Rg',
    S = 'search history',
  },
  g = {
    name = '+git',
    b = 'branches',
    bc = 'bcommits',
    c = 'commits',
    f = 'files',
    g = {':G', 'fugitive'},
    s = 'status',

  },
  G = { 'Glow', 'glow' },
  h = { '<C-w>s', 'split below' },
  l = { '<cmd>Limelight!!', 'limelight' },
  p = {
    name = '+packer',
    i = {':PackerInstall', 'install'},
    c = {':PackerClean',   'clean'},
    s = {':PackerSync',  'sync'},
    u = {':PackerUpdate',  'update'},
  },
  q = 'close',
  r = 'rename',
  S = {
    name = '+sessions',
    S = { '<cmd>Startify', 'startify' },
    c = { 'SClose', 'close' },
    d = { 'SDelete', 'delete' },
    l = { 'SLoad', 'load' },
    s = { 'SSave', 'save' },
  },
  t = {
    name = "+terminal" ,
    t = 'terminal',
  },
  T = {
    name = '+todo',
    t = { 'Todo', "todo" },
    T = { ':Todo g', 'general todo' },
  },
  v = { '<C-w>v', 'split right' },
  w = {
    name = '+wiki',
    w = 'index',
    t = 'tab index',
    s = 'select',
    i = 'diary index',
    e = 'split link',
    q = 'vsplit link',
  },
  W = { 'ToggleWhitespace', 'toggle whitespace' },
  z = { 'Goyo', 'goyo' },
}

vim.cmd('call which_key#register(\'<Space>\', "g:which_key_map")')
