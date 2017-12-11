spaces = require("hs._asm.undocumented.spaces")

local window_manager = { "cmd", "alt", "ctrl" }
hs.window.animationDuration = 0

hs.hotkey.bind(window_manager, "G", function()
  hs.grid.show()
end)

hs.hotkey.bind(window_manager, "F", function()
  hs.window.focusedWindow():toggleFullScreen()
end)

hs.hotkey.bind(window_manager, "L", function()
  screen = hs.screen('1,0')
  window = hs.window.focusedWindow()
  window:setFullScreen(false)
  window:moveToScreen(screen)
end)

hs.hotkey.bind(window_manager, "H", function()
  screen = hs.screen('0,0')
  window = hs.window.focusedWindow()
  is_fullscreen = window:isFullScreen()
  window:setFullScreen(false)
  window:moveToScreen(screen)
end)

