module Rocx
  module Properties
    class Indentation < BaseProperty
      attr_reader :value

      OK_KEYS = [:end, :endChars, :firstLine, :firstLineChars, :hanging, :hangingChars, :start, :startChars]

      def initialize(value)
        @value = value
        raise ArgumentError invalid_message unless valid?
      end

      def invalid_message
        "Invalid value for indentation"
      end

      def valid?
        value.keys.all?(&OK_KEYS.method(:member?))
      end

      def to_xml(xml)
        return unless value.length > 0
        namespaced_values = value.each_with_object({}) do |(prop, value), values|
          values["w:#{prop}"] = value
        end
        xml["w"].ind(namespaced_values) if value
      end

    end
  end
end
