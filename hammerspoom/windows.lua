spaces = require("hs._asm.undocumented.spaces")

local app_manager = { "cmd", "alt", "ctrl" }

hs.hotkey.bind(app_manager, "G", function()
  hs.grid.show()
end)

hs.hotkey.bind(app_manager, "F", function()
  hs.window.focusedWindow():toggleFullScreen()
end)

hs.hotkey.bind(app_manager, "L", function()
  screen = hs.screen('1,0')
  window = hs.window.focusedWindow()
  window:setFullScreen(false)
  window:moveToScreen(screen)
end)

hs.hotkey.bind(app_manager, "H", function()
  screen = hs.screen('0,0')
  window = hs.window.focusedWindow()
  is_fullscreen = window:isFullScreen()
  window:setFullScreen(false)
  window:moveToScreen(screen)
end)

hs.hotkey.bind(app_manager, "6", function()
  hs.screen:spaces()
end)
