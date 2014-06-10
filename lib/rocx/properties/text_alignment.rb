module Rocx
  module Properties
    class TextAlignment < BaseProperty

      def ok_values
        %i(auto baseline bottom center top)
      end

      def to_xml(xml)
        xml["w"].public_send(tag, "w:val" => value)
      end

    end
  end
end
