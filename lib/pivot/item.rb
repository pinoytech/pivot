module Pivot
  class Item
    attr_reader :name, :points
    attr_accessor :assignee

    VALID_PROJECT_CODES = %w[EREC AZR].freeze

    def initialize(name:, points:, assignee: nil)
      @name = name
      @assignee = assignee
      @points = points
    end

    def +(other)
      points + other.points
    end

    def project_code
      name.gsub(/-\d*/, '')
    end

    def valid?
      VALID_PROJECT_CODES.include?(project_code)
    end
  end
end
