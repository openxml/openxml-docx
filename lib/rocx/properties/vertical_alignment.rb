module Rocx
  module Properties
    class VerticalAlignment < BaseProperty

      def ok_values
        %i(baseline subscript superscript)
      end

      def tag
        :vertAlign
      end

      def to_xml(xml)
        xml["w"].public_send(tag, "w:val" => value)
      end

    end
  end
end
