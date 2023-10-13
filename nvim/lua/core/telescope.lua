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
			".git/",
			".vscode/",
			".npm/",
      ".idea/",
      ".dart_tool/",
			".next/",

			"node_modules/",
			"vendor/",
			"dist/",
			"coverage/",
			"packages/",
			"logs/",
      "android/",
      "ios/",
      "build/",
      "tmp/",
      "log/",

			"%.log",
			"%.DS_Store",
		},
	},
})

require("telescope-lsp-handlers").setup()
