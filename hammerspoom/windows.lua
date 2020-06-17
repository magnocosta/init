window_manager = { "cmd", "alt" }
window_mana    = { "cmd", "alt", "ctrl" }

hs.window.animationDuration = 0

hs.hotkey.bind(window_manager, "A", function()
  expose = hs.expose.new()
  expose:show()
end)

hs.hotkey.bind(window_manager, "G", function()
  splitScreenByCurrentWindows()
end)

hs.hotkey.bind(window_manager, "F", function()
  hs.window.focusedWindow():maximize()
end)

hs.hotkey.bind(window_manager, "L", function()
  moveFocusedWindowToScreen('1,0')
end)

hs.hotkey.bind(window_manager, "H", function()
  moveFocusedWindowToScreen('0,0')
end)

hs.hotkey.bind(window_mana, "L", function()
  moveAllAppsToScreen('1,0')
end)

hs.hotkey.bind(window_mana, "H", function()
  moveAllAppsToScreen('0,0')
end)

function moveAllAppsToScreen(target)
  currentScreen = hs.screen(target)
  for _,app in ipairs(hs.application.runningApplications()) do
    for _,w in ipairs(app:allWindows()) do 
      w:moveToScreen(currentScreen)
    end
  end
end

function moveFocusedWindowToScreen(target)
  currentScreen = hs.screen(target)
  currentWindow = hs.window.focusedWindow()
  currentWindow:moveToScreen(currentScreen)
end

function getWindowsByCurrentScreen()
  currentWindow = hs.window.focusedWindow()
  currentScreen = currentWindow:screen()
  
  windowsByCurrentScreen={}
  windowsByCurrentScreen.size=0
  windowsByCurrentScreen.items={}

  for _,app in ipairs(hs.application.runningApplications()) do
    for _,w in ipairs(app:visibleWindows()) do 
      if w:screen() == currentScreen and  w:title() ~= "" then
        windowsByCurrentScreen.items[windowsByCurrentScreen.size] = w
        windowsByCurrentScreen.size = windowsByCurrentScreen.size + 1
      end
    end
  end

  return windowsByCurrentScreen
end

function splitScreenByCurrentWindows()
  windows = getWindowsByCurrentScreen()
  hs.grid.setGrid(windows.size..'x1')
  for i,w in pairs(windows.items) do 
    hs.grid.set(w, {x=i, y=1, w=1, h=1}, hs.screen.mainScreen())
  end
end
