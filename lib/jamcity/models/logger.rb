# frozen_string_literal: true

require 'logger'

module Jamcity
  class Logger < Logger
    def initialize(*args)
      $stdout.sync = true
      super($stdout, level: Logger::INFO)
    end
  end
end
