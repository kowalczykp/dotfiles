# encoding: UTF-8
require '/Applications/Zephyros.app/Contents/Resources/libs/zephyros.rb'

mash = ['cmd', 'alt', 'ctrl']

def full_frame(screen)
  # this is to tweak the full screen
  frame = screen.frame_without_dock_or_menu
  frame.x -= 4
  frame.w += 4
  frame
end

API.bind 'SPACE', mash do
  win = API.focused_window
  win.frame = full_frame(win.screen)
end

API.bind 'UP', mash do
  win = API.focused_window
  frame = full_frame(win.screen)
  frame.h /= 2
  win.frame = frame
end

API.bind 'DOWN', mash do
  win = API.focused_window
  frame = full_frame(win.screen)
  frame.y += frame.h / 2
  frame.h /= 2
  win.frame = frame
end

API.bind 'LEFT', mash do
  win = API.focused_window
  frame = full_frame(win.screen)
  frame.w /= 2
  win.frame = frame
end

API.bind 'RIGHT', mash do
  win = API.focused_window
  frame = full_frame(win.screen)
  frame.x += frame.w / 2
  frame.w /= 2
  win.frame = frame
end

wait_on_callbacks
