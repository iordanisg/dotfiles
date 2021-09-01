local present, autosession = pcall(require, 'auto-session')

if not present then
  return
end

local opts = {
  auto_save_enabled = false,
}

autosession.setup(opts)
