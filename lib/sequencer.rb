require 'pry'
require 'socket'
require 'ruby2d'
require 'config-reader'
$LOAD_PATH.unshift File.expand_path('../', __FILE__)
require 'models/element'
require 'models/layout'

def config
  @config ||= ConfigReader.new('config/sequencer.yml', :sequencer).config
end

# @example send_msg('d1 $ n "c g f" # s "supersaw"')
def send_msg(message)
  hostname = 'localhost'
  port = 2000
  socket = TCPSocket.open(hostname, port)
  socket.sendmsg(message)
  socket.close
end


def refresh_window(overrides = {})
  set config[:window].merge(overrides)
end


module Jamcity;end

# ---

layout = Jamcity::Layout.new

(0..3).map do |channel|
  (0..15).map do |step|
    layout.add_step(step, channel)
  end
end

layout.refresh

on :mouse_down do |event|
  layout.refresh

  button = layout.collection.detect { |element| element.contains?(event.x, event.y) }

  button.render(color: 'red') if button
end

refresh_window title: 'WIP: Jamcity'
show