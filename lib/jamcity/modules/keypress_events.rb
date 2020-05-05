# frozen_string_literal: true

require 'jamcity/listeners/hush_listener'
require 'jamcity/listeners/play_listener'
require 'jamcity/listeners/shift_mode_listener'

module Jamcity
  module KeypressEvents
    def keypress(event)
      listener = keypress_listeners.detect do |listener|
        listener.match?(event) && listener.respond_to?(event.type)
      end

      listener&.send(event.type, event)
    end

    private

    def keypress_listeners
      @keypress_listeners ||= [
        HushListener,
        PlayListener,
        ShiftModeListener
      ].map { |listener| listener.new(self) }
    end
  end
end
