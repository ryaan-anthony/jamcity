require 'pry'
require 'socket'
require 'ruby2d'
$LOAD_PATH.unshift File.expand_path('../', __FILE__)
require 'jamcity/main'

# ---

main = Jamcity::Main

main.layout.draw

on :mouse_move do |event|
  main.mouse_event(event)
end

on :mouse_up do |event|
  main.mouse_event(event)
end

on :mouse_down do |event|
  main.mouse_event(event)
end

on :key_down do |event|
  main.keypress(event)
end

on :key_up do |event|
  main.keypress(event)
end

set main.config[:window]
show
