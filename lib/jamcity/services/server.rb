# frozen_string_literal: true

require 'config-reader'
require 'json'
require 'socket'

module Jamcity
  class Server
    class << self
      def run(app)
        @app = app
        app.logger.info "Listening on port #{port}"
        loop { accept_connection }
      rescue SystemExit, Interrupt
        app.logger.info 'Connection closed'
      end

      private

      def accept_connection
        socket = connection.accept
        socket.write receive_message(socket.gets)
        socket.close_write
      rescue StandardError => e
        @app.logger.error e.message
      end

      def receive_message(message)
        action, channel, request = message.split(' ', 3)
        response = nil
        case action
          when '/play'
            # todo
            response = request
          when '/stop'
            # todo
          when '/record'
            # todo
          else
            response = 'Invalid method'
        end
        { body: response }.to_json
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
