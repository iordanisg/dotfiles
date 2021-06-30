function map(mode, key, result, opts)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {
      noremap = opts.noremap or false,
      silent = opts.silent or false,
      expr = opts.expr or false,
      script = opts.script or false,
    }
  )
end
