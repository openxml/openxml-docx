module Rocx
  module Properties
    class Alignment
      attr_reader :value

      OK_VALUES = [:both, :center, :distribute, :end, :highKashida, :lowKashida, :mediumKashida, :numTab, :start, :thaiDistribute]

      def initialize(value)
        @value = value
        raise ArgumentError invalid_message unless valid?
      end

      def invalid_message
        "Invalid value for alignment; acceptable values are #{OK_VALUES.join(", ")}"
      end

      def valid?
        OK_VALUES.member? value
      end

      def to_xml(xml)
        xml["w"].jc("w:val" => value) if value
      end

    end
  end
end
