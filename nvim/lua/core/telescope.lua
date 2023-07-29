local status_ok, telescope = pcall(require, "telescope")

if not status_ok then
	return
end

telescope.setup({
	pickers = {
		find_files = {
			hidden = false,
		},
    git_branches = {
      theme = "dropdown",
    }
	},
	defaults = {
		file_ignore_patterns = {
			"^node_modules/",
			"^vendor/",
			"^tmp/",
			"^dist/",
			"^.git/",
			"^.vscode/",
			"^dist/",
			"^build/",
			"^coverage/",
			"^packages/",
			"^logs/",
			"^.npm/",
			"^.next/",
			"%.log",
			"%.DS_Store",
		},
	},
})

require("telescope-lsp-handlers").setup()
