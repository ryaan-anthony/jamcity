module Jamcity
  class ShiftModeListener
    class << self
      def match?(key)
        key == 'left shift' || key == 'right shift'
      end

      def down(app)
        app.shift_mode = true
      end

      def up(app)
        app.shift_mode = false
      end
    end
  end
end