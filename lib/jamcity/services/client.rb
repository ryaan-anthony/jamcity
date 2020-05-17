# frozen_string_literal: true

module Jamcity
  class Client
    class << self
      def send_message(message)
        hostname = 'localhost'
        port = 2000
        socket = TCPSocket.open(hostname, port)
        socket.sendmsg(message)
        socket.close
      end
    end
  end
end
