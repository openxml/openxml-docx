module Rocx
  module Properties
    class VerticalAlignment < BaseProperty

      def ok_values
        %i(auto baseline bottom center top)
      end

      def to_xml(xml)
        xml["w"].public_send(tag, "w:val" => value)
      end

      def tag
        :textAlignment
      end

    end
  end
end
