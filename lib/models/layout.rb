module Jamcity
  class Layout
    attr_reader :collection

    def initialize
      @collection = []
    end

    def add(element)
      @collection << element
    end

    def refresh
      collection.map(&:render)
    end

    def add_step(x, y)
      size = 50
      offset_x = 20
      offset_y = 125

      add Element.new(
        type: Square,
        size: size,
        x: (size * x + offset_x + x),
        y: (size * y + offset_y + y),
        color: y == 0 && x < 8 ? '#f7f7f7' : 'gray'
      )
    end
  end
end