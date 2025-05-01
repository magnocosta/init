local status_ok, plugin = pcall(require, "codecompanion")
if not status_ok then
  return
end

plugin.setup({
  file_types = { 'markdown', 'codecompanion' }
})
