module Jamcity
  class HushListener
    class << self
      def match?(key)
        key == 'escape'
      end

      def down(app)
        app.send_message('hush')
      end
    end
  end
end