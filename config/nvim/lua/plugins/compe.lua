local present, compe = pcall(require, 'compe')
if not present then
  return
end

compe.setup({
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = 'enable',
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,
  source = {
    path = true,
    buffer = true,
    calc = true,
    nvim_lsp = true,
    nvim_lua = true,
    luasnip = true,
    vsnip = false,
    ultisnips = false,
    spell = { filetypes = { 'gitcommit', 'markdown' } },
    tags = false,
    treesitter = false,
    neorg = true,
  },
})

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

-- https://github.com/L3MON4D3/LuaSnip/issues/1
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t('<C-n>')
  elseif require('luasnip').expand_or_jumpable() then
    return t("<cmd>lua require'luasnip'.jump(1)<Cr>")
  elseif check_back_space() then
    return t('<Tab>')
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t('<C-p>')
  elseif require('luasnip').jumpable(-1) then
    return t("<cmd>lua require'luasnip'.jump(-1)<CR>")
  else
    return t('<S-Tab>')
  end
end

function _G.completions()
  local npairs
  if not pcall(function()
    npairs = require('nvim-autopairs')
  end) then
    return
  end

  if vim.fn.pumvisible() == 1 then
    if vim.fn.complete_info()['selected'] ~= -1 then
      return vim.fn['compe#confirm']('<CR>')
    end
  end
  return npairs.check_break_line_char()
end
