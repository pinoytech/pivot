module Pivot
  class Person
    attr_reader :email, :first_name, :last_name

    def initialize(email:, first_name:, last_name:)
      @email = email
      @first_name = first_name
      @last_name = last_name
    end

    def add_item(item, &blk)
      item.assignee = email
      items << item
      yield blk if block_given?
    end

    def items
      @items ||= []
    end
  end
end
