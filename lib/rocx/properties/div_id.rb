module Rocx
  module Properties
    class DivId < ValueProperty

      def valid?
        value.is_a?(Integer)
      end

      def invalid_message
        "Invalid value for #{name}; acceptable values are integers"
      end

    end
  end
end
