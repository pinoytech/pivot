require 'logger'

module Pivot
  class Logger < Logger
    def initialize(*args)
      super(*args)
    end
  end
end
