require 'socket'
require 'ruby2d'
require 'config-reader'


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




# ---

refresh_window title: 'WIP: Jamcity'
show