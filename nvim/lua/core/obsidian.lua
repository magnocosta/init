local status_ok, obsidian = pcall(require, "obsidian")

if not status_ok then
	return
end

obsidian.setup({
  ui = {
    enable = false,
  },
  workspaces = {
    {
      name = "personal",
      path = "~/dev/tools/obsidian/my-vault",
    }
  },
})
