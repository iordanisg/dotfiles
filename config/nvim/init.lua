local main_modules = {
  'options',
  'mappings',
  'autocommands',
}

for i = 1, #main_modules, 1 do
  pcall(require, main_modules[i])
end
