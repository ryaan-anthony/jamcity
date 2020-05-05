# frozen_string_literal: true

require 'config-reader'
require 'jamcity/models/layout'
require 'jamcity/models/state'
require 'jamcity/modules/keypress_events'
require 'jamcity/modules/mouse_events'
require 'jamcity/services/tidal_cycles'

module Jamcity
  class Main
    class << self
      include KeypressEvents
      include MouseEvents

      def config
        @config ||= ConfigReader.new('config/jamcity.yml', :jamcity).config
      end

      def layout
        @layout ||= Layout.new
      end

      def state
        @state ||= State.new
      end

      def send_message(message)
        TidalCycles.send_message(message)
      end
    end
  end
end
