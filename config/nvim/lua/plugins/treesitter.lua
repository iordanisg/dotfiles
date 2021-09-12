local present, ts_config = pcall(require, 'nvim-treesitter.configs')
if not present then
  return
end

ts_config.setup({
  ensure_installed = {
    'bash',
    'bash',
    'dockerfile',
    'go',
    'gomod',
    'hcl',
    'html',
    'json',
    'lua',
    'python',
    'toml',
    'yaml',
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',

        -- Or you can define your own textobjects like this
        ['iF'] = {
          python = '(function_definition) @function',
          cpp = '(function_definition) @function',
          c = '(function_definition) @function',
          java = '(method_declaration) @function',
        },
      },
    },
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
        ['df'] = '@function.outer',
        ['dF'] = '@class.outer',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
})
