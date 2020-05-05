require 'config-reader'
require 'jamcity/listeners/hush_listener'
require 'jamcity/listeners/play_listener'
require 'jamcity/listeners/shift_mode_listener'
require 'jamcity/models/layout'
require 'jamcity/services/tidal_cycles'

module Jamcity
  class Main
    class << self
      attr_accessor :shift_mode

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

      def listeners
        [
          HushListener,
          PlayListener,
          ShiftModeListener
        ]
      end
    end
  end
end