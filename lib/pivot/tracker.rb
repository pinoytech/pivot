module Pivot
  class Tracker
    class << self
      def count(items)
        items.count
      end

      def item_for(items, email)
        items.last { |item| item[:assignee] == email }
      end

      def pivoted?(items, email)
        items.any? { |item| item[:assignee] == email }
      end

      # Refer to `00_track_pivots_spec.rb` comments in line 42
      # def total_points(items, assignee: nil)
      #   return items.reverse.uniq { |item| item[:assignee] }.sum { |item| item[:points] } if assignee.nil?

      #   items.reverse.select { |item| item[:assignee] == assignee }.sum { |item| item[:points] }
      # end

      def total_points(items, assignee: nil)
        return items.sum { |item| item[:points] } if assignee.nil?

        items.select { |item| item[:assignee] == assignee }.sum { |item| item[:points] }
      end

      def unique_assignees(items)
        items.uniq { |item| item[:assignee] }
      end
    end
  end
end
