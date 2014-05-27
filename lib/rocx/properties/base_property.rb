module Rocx
  module Properties
    class BaseProperty
      attr_reader :value

      OK_VALUES = [nil, true, false]

      def initialize(value)
        @value = value
        raise ArgumentError, invalid_message unless valid?
      end

      def valid?
        OK_VALUES.member? value
      end

      def invalid_message
        "Invalid value for #{name}; acceptable values are #{OK_VALUES.join(", ")}"
      end

      def name
        class_name.gsub(/(.)([A-Z])/, '\1_\2').downcase
      end

      def tag
        (class_name[0, 1].downcase + class_name[1..-1]).to_sym
      end

    private

      def class_name
        self.class.to_s.split(/::/).last
      end

    end
  end
end
