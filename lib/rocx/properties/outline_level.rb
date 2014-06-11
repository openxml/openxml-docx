module Rocx
  module Properties
    class OutlineLevel < ValueProperty
      tag :outlineLvl

      def valid?
        value.is_a?(Integer) && value >= 0
      end

      def invalid_message
        "Invalid value for #{name}; acceptable values are integers greater than or equal to 0"
      end

    end
  end
end
