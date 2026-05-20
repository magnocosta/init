local status_ok, mason = pcall(require, 'mason')
if not status_ok then 
  print('Error when load mason.nvim')
  return
end

local status_config_ok, masonLspConfig = pcall(require, 'mason-lspconfig')
if not status_config_ok then 
  print('Error when load mason-lspconfig')
  return
end

mason.setup()
masonLspConfig.setup({
  ensure_installed = {
    'lua_ls',
    'eslint',
    'ts_ls',
    'terraformls',
    'dockerls',
    'gopls',
    'ruby_lsp',
  },
  automatic_installation = true,
})
