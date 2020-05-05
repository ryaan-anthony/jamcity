# frozen_string_literal: true

require 'jamcity/views/note_field'
require 'jamcity/views/step_grid'

module Jamcity
  class Layout
    include NoteField
    include StepGrid
    attr_reader :collection

    def initialize
      @collection = {}
    end

    def add(type, element)
      @collection[type] ||= []
      @collection[type] << element
    end

    def refresh
      collection.values.flatten.map(&:render)
    end
  end
end
