# frozen_string_literal: true

require 'jamcity/models/elements/note'

module Jamcity
  module NoteField
    def notes
      collection[:note]
    end

    def add_note(x)
      size = 60
      offset_x = 182
      offset_y = 30

      add :note, Elements::Note.new(
        type: Square,
        size: size,
        x: (size * x + offset_x + x),
        y: offset_y,
        color: '#f7f7f7'
      )
    end
  end
end