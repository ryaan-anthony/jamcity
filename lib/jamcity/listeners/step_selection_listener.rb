# frozen_string_literal: true

require 'jamcity/listener'

module Jamcity
  class StepSelectionListener < Listener
    def match?(event)
      app.layout.collection.any? do |element|
        element.contains?(event.x, event.y)
      end
    end

    def down(event)
      app.layout.refresh
      button = app.layout.collection.detect do |element|
        element.contains?(event.x, event.y)
      end

      button.render(color: app.state.shift_mode ? 'red' : 'blue')
    end
  end
end
