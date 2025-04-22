vim.g.copilot_no_tab_map = true

vim.api.nvim_set_keymap("i", "<C-y>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  silent = true,
  script = true,
  noremap = true,
})
