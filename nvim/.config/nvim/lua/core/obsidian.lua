local status_ok, obsidian = pcall(require, "obsidian")

if not status_ok then
	return
end

obsidian.setup({
  ui = {
    enable = false,
  },
  daily_notes = {
    folder = "notes/diario",
    default_tags = { "daily-notes", "diario" },
  },
  workspaces = {
    {
      name = "personal",
      path = "~/Work/tools/obsidian/my-vault",
    }
  },
})
