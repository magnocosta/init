
local app_manager = { "cmd", "alt", "ctrl" }

hs.hotkey.bind(app_manager, "C", function()
  hs.application.launchOrFocus("Google Chrome")
end)

hs.hotkey.bind(app_manager, "S", function()
  hs.application.launchOrFocus("Sublime Text")
end)

hs.hotkey.bind(app_manager, "T", function()
  hs.application.launchOrFocus("iTerm")
end)

hs.hotkey.bind(app_manager, "K", function()
  hs.application.launchOrFocus("Slack")
end)

hs.hotkey.bind(app_manager, "W", function()
  hs.application.launchOrFocus("WhatsApp")
end)

hs.hotkey.bind(app_manager, "R", function()
  hs.application.launchOrFocus("Spark")
end)

hs.hotkey.bind(app_manager, "E", function()
  hs.application.launchOrFocus("Microsoft Teams")
end)

