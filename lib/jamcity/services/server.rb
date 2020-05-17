# frozen_string_literal: true

require 'config-reader'
require 'socket'

module Jamcity
  class Server
    class << self
      def run(app)
        @app = app
        puts "Listening on port #{port}"
        loop { accept_connection }
      rescue SystemExit, Interrupt
        puts '- Stopping...'
      end

      private

      def accept_connection
        socket = connection.accept
        socket.write receive_message(socket.gets)
        socket.close_write
      end

      def receive_message(message)
        response = 'TODO'
        "Request: #{message}, Response: #{response}"
      end

      def connection
        @connection ||= TCPServer.open(port)
      end

      def port
        @app.config.server['port']
      end
    end
  end
end
