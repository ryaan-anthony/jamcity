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
        socket = TCPSocket.open(host, port)
        socket.sendmsg(message)
        socket.close_write
        puts socket.read
        socket.close
      end

      def host
        @app.config.server['host']
      end

      def port
        @app.config.server['port']
      end
    end
  end
end
