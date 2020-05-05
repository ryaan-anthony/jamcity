# frozen_string_literal: true

require 'jamcity/listener'

module Jamcity
  class ShiftModeListener < Listener
    def match?(event)
      event.key == 'left shift' || event.key == 'right shift'
    end

    def down(event)
      app.state.shift_mode = true
    end

    def up(event)
      app.state.shift_mode = false
    end
  end
end
