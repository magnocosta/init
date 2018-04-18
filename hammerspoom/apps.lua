
local app_manager = { "cmd", "alt", "ctrl" }

local shortcuts = {
  { shortcut = "Q", command = "Spark" },
  { shortcut = "W", command = "WhatsApp" },
  { shortcut = "E", command = "Slack" },
  { shortcut = "R", command = "MIcrosoft Teams" },
  { shortcut = "T", command = "Discord" },

  { shortcut = "P", command = "iTerm" },
  { shortcut = "O", command = "Sublime Text" },
  { shortcut = "I", command = "Postman" },
  { shortcut = "U", command = "Dash" },

  { shortcut = "M", command = "Google Chrome" },
  { shortcut = "N", command = "Firefox" },
  { shortcut = "B", command = "Safari" },

  { shortcut = "A", command = "Spotify" },
  { shortcut = "S", command = "TweetDeck" }
}

local shortcuts_help = ""

for k, v in ipairs(shortcuts) do
  hs.hotkey.bind(app_manager, v.shortcut, function()
    hs.application.launchOrFocus(v.command)
  end)
  shortcuts_help = shortcuts_help .. v.shortcut .. " - " .. v.command .. "\n"
end

hs.hotkey.bind(app_manager, "/", function()
  hs.alert.show(shortcuts_help)
end)

hs.hotkey.bind(app_manager, "Z", function()
  for k, v in ipairs(shortcuts) do
    hs.application.open(v.command)
  end
end)

hs.hotkey.bind(app_manager, "X", function()
  for k, v in ipairs(shortcuts) do
    hs.alert.show("try full: " .. v.command)
    app = hs.application.get(v.command)
    window = app:mainWindow()
    window:setFullScreen(true)
  end
end)

hs.hotkey.bind(app_manager, "C", function()
  for k, v in ipairs(shortcuts) do
    hs.alert.show("try kill: " .. v.command)
    app = hs.application.get(v.command)
    app:kill9()
    hs.alert.show("Kill: " .. v.command)
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
