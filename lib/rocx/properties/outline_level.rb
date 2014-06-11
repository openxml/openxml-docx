module Rocx
  module Properties
    class OutlineLevel < BaseProperty
      tag :outlineLvl

      def valid?
        value.is_a?(Integer) && value >= 0
      end

      def invalid_message
        "Invalid value for #{name}; acceptable values are integers greater than or equal to 0"
      end

      def to_xml(xml)
        xml["w"].public_send(tag, "w:val" => value)
      end

    end
  end
end
