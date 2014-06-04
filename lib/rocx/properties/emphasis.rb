module Rocx
  module Properties
    class Emphasis < BaseProperty

      def ok_values
        %i(circle comma dot none underDot)
      end

      def tag
        :em
      end

      def to_xml(xml)
        xml["w"].public_send(tag, "w:val" => value)
      end

    end
  end
end
