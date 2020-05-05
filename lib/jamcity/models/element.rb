module Jamcity
  class Element
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def render(overrides = {})
      @rendered = type.new(data.merge(overrides))
    end

    def contains?(x, y)
      rendered.contains?(x, y)
    end

    private

    def rendered
      @rendered ||= type.new(data)
    end

    def type
      data[:type]
    end
  end
end