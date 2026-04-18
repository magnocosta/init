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
      pattern = "refs/heads/**",
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
      "tmp/",
      "log/",

			"%.log",
			"%.DS_Store",
		},
	},
})

require("telescope-lsp-handlers").setup()
