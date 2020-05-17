# frozen_string_literal: true

require 'config-reader'
require 'jamcity/models/layout'
require 'jamcity/models/state'
require 'jamcity/services/server'
require 'jamcity/services/client'

module Jamcity
  class Main
    class << self
      def server
        Server.run(self)
      end

      def client
        Client.run(self)
      end

      def config
        @config ||= ConfigReader.new('config/jamcity.yml', :jamcity).config
      end

      def layout
        @layout ||= Layout.new
      end

      def state
        @state ||= State.new
      end
    end
  end
end
