local status_ok, indentBlankLine = pcall(require, "indent_blankline")

if not status_ok then
	return
end

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

indentBlankLine.setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
})
