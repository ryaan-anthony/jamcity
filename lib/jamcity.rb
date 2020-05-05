require 'pry'
require 'socket'
require 'ruby2d'
$LOAD_PATH.unshift File.expand_path('../', __FILE__)
require 'jamcity/main'

# ---

main = Jamcity::Main

(0..3).map do |channel|
  (0..15).map do |step|
    main.layout.add_step(step, channel)
  end
end
main.layout.refresh

on :mouse_down do |event|
  main.layout.refresh
  button = main.layout.collection.detect { |element| element.contains?(event.x, event.y) }
  button.render(color: 'red') if button
end

on :key_down do |event|
  listener = main.listeners.detect { |listener| listener.match? event.key }
  listener.down(main) if listener.respond_to? :down
end

on :key_up do |event|
  listener = main.listeners.detect { |listener| listener.match? event.key }
  listener.up(main) if listener.respond_to? :up
end

set main.config[:window]
show