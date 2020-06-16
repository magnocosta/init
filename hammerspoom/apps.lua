local alert  = require("hs.alert")
local layout = require("hs.layout")

hs.application.enableSpotlightForNameSearches(true)

local app_manager = { "cmd", "alt" }

-------------------------------------
-- Window layouts
-------------------------------------
local centerScreen = hs.screen{x=0,y=0}
local rightScreen  = hs.screen{x=1,y=0}

local twoScreenLayout = {
 {"Iterm",         nil, centerScreen, layout.maximized, nil, nil},
 {"Google Chrome", nil, centerScreen, layout.maximized, nil, nil},

 {"WhatsApp",      nil, rightScreen, layout.maximized, nil, nil},
 {"Slack",         nil, rightScreen, layout.maximized, nil, nil},
 {"Telegram",      nil, rightScreen, layout.maximized, nil, nil},

 {"Sublime Text", nil, rightScreen,  layout.maximized, nil, nil},
 {"Spotify",      nil, rightscreen,  layout.maximized, nil, nil}
}

function switchLayout()
  local numScreens = 2
  if numScreens == 1 then
    myLayout = twoScreenLayout
  elseif numScreens == 2 then
    myLayout = twoScreenLayout
  elseif numScreens == 3 then
    myLayout = {}
  end
  layout.apply(myLayout)
end

hs.hotkey.bind(app_manager, "s", function()
  switchLayout()
end)


local shortcuts = {
  { shortcut = "]", command = "iTerm" },
  { shortcut = "[", command = "Google Chrome" },
  
  { shortcut = "W", command = "WhatsApp" },
  { shortcut = "E", command = "Slack" },
  { shortcut = "R", command = "Telegram" },

  { shortcut = "O", command = "Sublime Text" },
  { shortcut = "A", command = "Spotify" },
  { shortcut = "R", command = "TweetDeck" },
  { shortcut = "Z", command = "TogglDesktop" }
}

local shortcuts_help = ""

for k, v in ipairs(shortcuts) do
  hs.hotkey.bind(app_manager, v.shortcut, function()
   app = hs.application.launchOrFocus(v.command)
  end)
  shortcuts_help = shortcuts_help .. v.shortcut .. " - " .. v.command .. "\n"
end

hs.hotkey.bind(app_manager, "/", function()
  alert.show(shortcuts_help)
end)

hs.hotkey.bind(app_manager, "Z", function()
  for k, v in ipairs(shortcuts) do
    hs.application.open(v.command)
  end
end)

hs.hotkey.bind(app_manager, "C", function()
  for k, v in ipairs(shortcuts) do
    app = hs.application.get(v.command)
    if app == nil then
      alert.show("Hammerspoon can't close app "..v.command)
    else
      app:kill9()
    end
  end
end)

switcher = nil

hs.window.filter.default:subscribe(hs.window.filter.windowFocused, function()
  switcher = hs.window.switcher.new(hs.window.focusedWindow():application():name())
end)

hs.hotkey.bind(app_manager, ".", function()
  switcher:next()
end)

hs.hotkey.bind(app_manager, ",", function()
  switcher:previous()
end)
