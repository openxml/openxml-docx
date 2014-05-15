module Rocx
  module Properties
    class Italics
      attr_reader :value

      OK_VALUES = [true, false]

      def initialize(value)
        @value = value
        raise ArgumentError, invalid_message unless valid?
      end

      def valid?
        OK_VALUES.member? value
      end

      def invalid_message
        "Invalid value for italics; acceptable values are #{OK_VALUES.join(", ")}"
      end

      def to_xml(xml)
        xml["w"].i if value
      end

    end
  end
end
