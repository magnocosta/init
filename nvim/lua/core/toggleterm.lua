local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

require("toggleterm").setup({
  open_mapping = [[<c-t>]],
	direction = "float",
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})
