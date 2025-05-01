local status_ok, markdown = pcall(require, "render-markdown")

if not status_ok then
	return
end

local options = {
  file_types = { "markdown", "codecompanion" }
}

markdown.setup(options)
