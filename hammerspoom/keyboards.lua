local hello = { "alt" }

hs.hotkey.bind(hello, "H", function()
  hs.eventtap.event.newKeyEvent(hs.keycodes.map.left, true):post()
end)

hs.hotkey.bind(hello, "J", function()
  hs.eventtap.event.newKeyEvent(hs.keycodes.map.down, true):post()
end)

hs.hotkey.bind(hello, "k", function()
  hs.eventtap.event.newKeyEvent(hs.keycodes.map.up, true):post()
end)

hs.hotkey.bind(hello, "L", function()
  hs.eventtap.event.newKeyEvent(hs.keycodes.map.right, true):post()
end)
