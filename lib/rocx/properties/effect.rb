module Rocx
  module Properties
    class Effect < BaseProperty

      def ok_values
        %i(antsBlack antsRed blinkBackground lights none shimmer sparkle)
      end

      def to_xml(xml)
        xml["w"].public_send(tag, "w:val" => value)
      end

    end
  end
end
