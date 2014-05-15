module Rocx
  module Properties
    class Bold
      attr_reader :value

      OK_VALUES = [true, false]

      def self.check(value)
        OK_VALUES.member? value
      end

      def self.invalid_message
        "Invalid value for italics; acceptable values are #{OK_VALUES.join(", ")}"
      end

      def initialize(value)
        @value = value
      end

      def to_xml(xml)
        xml["w"].i if value
      end

    end
  end
end
