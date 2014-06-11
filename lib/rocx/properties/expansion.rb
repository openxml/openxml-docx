module Rocx
  module Properties
    class Expansion < BaseProperty
      tag :w

      def valid?
        return false unless value =~ /(\d{1,3})%/
        percentage = $1.to_i
        percentage >= 1 && percentage <= 600
      end

      def invalid_message
        "Invalid #{name}: value must be a percentage greater than 0 or less than 601"
      end

      def to_xml(xml)
        xml["w"].public_send(tag, "w:val" => value)
      end

    end
  end
end
