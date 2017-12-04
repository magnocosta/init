
local app_manager = { "cmd", "alt", "ctrl" }

hs.hotkey.bind(app_manager, "G", function()
  hs.grid.show()
end)
