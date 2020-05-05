require 'pry'
require 'socket'
require 'ruby2d'
$LOAD_PATH.unshift File.expand_path('../', __FILE__)
require 'jamcity/main'

# ---

main = Jamcity::Main

(0..7).map do |note|
  main.layout.add_note(note)
end

(0..3).map do |channel|
  (0..15).map do |step|
    main.layout.add_step(step, channel)
  end
end

main.layout.refresh

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
