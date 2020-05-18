# frozen_string_literal: true

module Jamcity
  class Client
    class << self
      def run(app)
        @app = app

        play(1, [{ note: '3C', duration: 0.5}, { note: '45', duration: 0.5}])
      end

      def play(channel, track)
        send_message("/play #{channel} #{track.to_json}")
      end

      private

      def send_message(message)
        connect do |socket|
          socket.sendmsg(message)
          socket.close_write
          puts socket.read # todo: handle response
        end
      end

      def connect
        socket = TCPSocket.open(server_host, server_port)
        yield socket
        socket.close
      end

      def server_host
        @app.config.server['host']
      end

      def server_port
        @app.config.server['port']
      end
    end
  end
end
