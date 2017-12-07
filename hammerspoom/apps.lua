
local app_manager = { "cmd", "alt", "ctrl" }

local shortcuts = {
  { shortcut = "Q", command = "Spark" },
  { shortcut = "W", command = "WhatsApp" },
  { shortcut = "E", command = "Slack" },
  { shortcut = "R", command = "MIcrosoft Teams" },


  { shortcut = "P", command = "iTerm" },
  { shortcut = "O", command = "Sublime Text" },

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

