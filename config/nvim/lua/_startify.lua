vim.g.startify_session_dir = '~/.config/nvim/session'

-- TODO: how to get the current directory in Lua?
vim.g.startify_lists = {
  { type = 'files', header = {'Files'} },
  { type = 'sessions', header = {'Sessions'} },
  { type = 'bookmarks', header = {'Bookmarks'} },
}

vim.g.startify_bookmarks = {
  { n = '~/.config/nvim/init.lua' },
  { t = '~/.tmux.conf' },
  { z = '~/.zshrc' },
}

vim.g.startify_session_autoload = 1
vim.g.startify_session_delete_buffers = 1
vim.g.startify_change_to_vcs_root = 1
vim.g.startify_fortune_use_unicode = 1
vim.g.startify_session_persistence = 1
vim.g.webdevicons_enable_startify = 1
