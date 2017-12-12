
local app_manager = { "cmd", "alt", "ctrl" }

local shortcuts = {
  { shortcut = "Q", command = "Spark" },
  { shortcut = "W", command = "WhatsApp" },
  { shortcut = "E", command = "Slack" },
  { shortcut = "R", command = "MIcrosoft Teams" },

  { shortcut = "P", command = "iTerm" },
  { shortcut = "O", command = "Sublime Text" },
  { shortcut = "I", command = "Postamn" },
  { shortcut = "U", command = "Dash" },

  { shortcut = "M", command = "Google Chrome" },
  { shortcut = "N", command = "Firefox" },
  { shortcut = "B", command = "Safari" }

}

local shortcuts_help = ""

for k, v in ipairs(shortcuts) do
  hs.hotkey.bind(app_manager, v.shortcut, function()
    hs.application.launchOrFocus(v.command)
  end)
  shortcuts_help = shortcuts_help .. v.shortcut .. " - " .. v.command .. "\n"
end

hs.hotkey.bind(app_manager, "A", function()
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
    app:kill()
    hs.alert.show("Kill: " .. v.command)
  end
end)
