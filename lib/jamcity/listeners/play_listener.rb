module Jamcity
  class PlayListener
    class << self
      def match?(key)
        key == 'space'
      end

      def down(app)
        if app.shift_mode
          app.send_message('d1 $ n "c3 g3 f3" # s "supersaw"')
        else
          app.send_message('d1 $ n "c g f" # s "supersaw"')
        end
      end
    end
  end
end