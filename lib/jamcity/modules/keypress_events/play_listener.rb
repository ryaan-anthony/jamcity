# frozen_string_literal: true

require 'jamcity/listener'

module Jamcity
  class PlayListener < Listener
    def match?(event)
      event.key == 'space'
    end

    def down(event)
      if app.shift_mode
        app.send_message('d1 $ n "c3 g3 e3" # s "midi"')
      else
        app.send_message('d1 $ n "c g e" # s "midi"')
      end
    end
  end
end
