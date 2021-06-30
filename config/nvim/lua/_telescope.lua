local opts = { noremap = true }

map('n', '<Leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<CR>', opts)
map('n', '<Leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<CR>', opts)
map('n', '<Leader>fF', '<cmd>lua require(\'telescope.builtin\').oldfiles()<CR>', opts)
map('n', '<Leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<CR>', opts)
map('n', '<Leader>fG', '<cmd>lua require(\'telescope.builtin\').grep_string()<CR>', opts)
map('n', '<Leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<CR>', opts)
map('n', '<Leader>fm', '<cmd>lua require(\'telescope.builtin\').marks()<CR>', opts)

map('n', '<Leader>gb', '<cmd>lua require(\'telescope.builtin\').git_branches()<CR>', opts)
map('n', '<Leader>gc', '<cmd>lua require(\'telescope.builtin\').git_commits()<CR>', opts)
map('n', '<Leader>gf', '<cmd>lua require(\'telescope.builtin\').git_files()<CR>', opts)
map('n', '<Leader>gs', '<cmd>lua require(\'telescope.builtin\').git_status()<CR>', opts)
map('n', '<Leader>gbc', '<cmd>lua require(\'telescope.builtin\').git_bcommits()<CR>', opts)
