# frozen_string_literal: true

require 'jamcity/listener'

module Jamcity
  class HushListener < Listener
    def match?(event)
      event.key == 'escape'
    end

    def down(event)
      app.send_message('hush')
    end
  end
end
