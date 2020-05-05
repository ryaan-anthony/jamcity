# frozen_string_literal: true

require 'jamcity/modules/mouse_events/step_selection_listener'

module Jamcity
  module MouseEvents
    def mouse_event(event)
      listener = mouse_event_listeners.detect do |listener|
        listener.match?(event) && listener.respond_to?(event.type)
      end

      listener&.send(event.type, event)
    end

    private

    def mouse_event_listeners
      @mouse_event_listeners ||= [
        StepSelectionListener
      ].map { |listener| listener.new(self) }
    end
  end
end
