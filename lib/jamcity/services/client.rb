# frozen_string_literal: true

module Jamcity
  class Client
    class << self
      def run(app)
        @app = app

        send_message('HOWDY')
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
