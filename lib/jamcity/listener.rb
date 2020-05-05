# frozen_string_literal: true

module Jamcity
  class Listener
    attr_reader :app

    def initialize(app)
      @app = app
    end
  end
end
