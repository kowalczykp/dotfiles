# encoding: UTF-8
# vim: set ft=ruby fenc=UTF-8 sw=2 ts=2 et:
require '/Applications/Zephyros.app/Contents/Resources/libs/zephyros.rb'

mash = ['cmd', 'alt', 'ctrl']

API.bind 'SPACE', mash do
  win = API.focused_window
  frame = win.screen.frame_without_dock_or_menu
  win.frame = frame
end

API.bind 'UP', mash do
  win = API.focused_window
  frame = win.screen.frame_without_dock_or_menu
  frame.h /= 2
  win.frame = frame
end

API.bind 'DOWN', mash do
  win = API.focused_window
  frame = win.screen.frame_without_dock_or_menu
  frame.y += frame.h / 2
  frame.h /= 2
  win.frame = frame
end

API.bind 'LEFT', mash do
  win = API.focused_window
  frame = win.screen.frame_without_dock_or_menu
  frame.w /= 2
  win.frame = frame
end

API.bind 'RIGHT', mash do
  win = API.focused_window
  frame = win.screen.frame_without_dock_or_menu
  frame.x += frame.w / 2
  frame.w /= 2
  win.frame = frame
end

wait_on_callbacks
