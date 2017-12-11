spaces = require("hs._asm.undocumented.spaces")

local space_manager = { "cmd", "alt", "ctrl" }

local one_screens = {
  {
    shortcut = "1",
    configs = {
      { app = "Postman", screen = "center", position = "full" }
    }
  }
}

local configs = one_screens

local left   = hs.screen('-1,0')
local center = hs.screen('0,0')
local right  = hs.screen('1,0')

local screen_persisted = {}

for k, v in ipairs(configs) do

  current_space_center = spaces.createSpace(center, true)
  -- current_space_right  = spaces.createSpace(right)

  for k, v in ipairs(v.configs) do
    hs.application.launchOrFocus(v.app)
    window = hs.window.focusedWindow()
    window:setFullScreen(true)
    -- spaces.moveWindowToSpace(window:id(), current_space_center)
  end

  hs.hotkey.bind(space_manager, v.shortcut, function()
    hs.alert.show("All spaces created")
  end)
end

hs.hotkey.bind(space_manager, "X", function()
  for k, v in ipairs(configs) do
    for k, v in ipairs(v.configs) do
      hs.application.launchOrFocus(v.app)
      window = hs.window.focusedWindow()
      window:setFullScreen(true)
      -- spaces.moveWindowToSpace(window:id(), current_space_center)
    end
  end
  hs.alert.show("All spaces removed")
end)

