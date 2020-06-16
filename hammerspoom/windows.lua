local spaces        = require("hs._asm.undocumented.spaces")
local grid          = require("hs.grid")
local window        = require("hs.window")
local screen        = require("hs.screen")
local hotkey        = require("hs.hotkey")
local application   = require("hs.application")
local alert         = require("hs.alert")
local grid          = require("hs.grid")

local window_manager = { "cmd", "alt" }
local window_mana    = { "cmd", "alt", "ctrl" }

window.animationDuration = 0

hotkey.bind(window_manager, "G", function()
  splitScreenByCurrentWindows()
end)

hotkey.bind(window_manager, "F", function()
  window.focusedWindow():maximize()
end)

hotkey.bind(window_manager, "L", function()
  moveFocusedWindowToScreen('1,0')
end)

hotkey.bind(window_manager, "H", function()
  moveFocusedWindowToScreen('0,0')
end)

hotkey.bind(window_mana, "L", function()
  moveAllAppsToScreen('1,0')
end)

hotkey.bind(window_mana, "H", function()
  moveAllAppsToScreen('0,0')
end)

function moveAllAppsToScreen(target)
  local currentScreen = screen(target)
  for _,app in ipairs(application.runningApplications()) do
    for _,w in ipairs(app:allWindows()) do 
      w:moveToScreen(currentScreen)
    end
  end
end

function moveFocusedWindowToScreen(target)
  local currentScreen = screen(target)
  local currentWindow = window.focusedWindow()
  currentWindow:moveToScreen(currentScreen)
end

function getWindowsByCurrentScreen()

end

function splitScreenByCurrentWindows()
  local currentWindow = window.focusedWindow()
  local currentScreen = currentWindow:screen()
  local count  = 0
  local windowsByCurrentScreen = {}

  for _,app in ipairs(application.runningApplications()) do
    for _,w in ipairs(app:visibleWindows()) do 
      if w:screen() == currentScreen and  w:title() ~= "" then
        count = count + 1
        windowsByCurrentScreen[count] = w
        -- alert.show(w:title())
      end
    end
  end

  -- alert.show(count)

  grid.setGrid(count..'x1')
  count = 0
  for _,w in ipairs(windowsByCurrentScreen) do 
    local geo = hs.geometry:point('0,0')
    grid.set(w, {x=count, y=1, w=1, h=1}, currentScreen)
    count = count + 1
  end

end
