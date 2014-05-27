module Rocx
  module Properties
    class DivId < BaseProperty

      def valid?
        value.is_a?(Integer)
      end

      def invalid_message
        "Invalid value for #{name}; acceptable values are integers"
      end

      def tag
        :divId
      end

      def to_xml(xml)
        xml["w"].public_send(tag, "w:val" => value)
      end

    end
  end
end
