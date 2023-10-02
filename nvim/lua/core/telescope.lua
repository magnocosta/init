local status_ok, telescope = pcall(require, "telescope")

if not status_ok then
	return
end

telescope.setup({
	pickers = {
		find_files = {
			hidden = true,
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
      "android",
      "ios",
      "build",
      ".idea",
      ".git",
      ".dart_tool"
		},
	},
})

require("telescope-lsp-handlers").setup()
