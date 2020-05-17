# frozen_string_literal: true

require 'jamcity/models/elements/step'

module Jamcity
  module StepGrid
    def draw_steps
      (0..1).map do |channel|
        (0..7).map do |step|
          add_step(step, channel)
        end
      end
    end

    def steps
      collection[:step]
    end

    def add_step(x, y)
      size = 120
      offset_x = 20
      offset_y = 125

      add :step, Elements::Step.new(
        type: Square,
        size: size,
        x: (size * x + offset_x + x),
        y: (size * y + offset_y + y),
        color: y == 0 && x < 8 ? '#f7f7f7' : 'gray'
      )
    end
  end
end