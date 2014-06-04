module Rocx
  module Properties
    class Highlight < BaseProperty

      def ok_values
        %i(black blue cyan darkBlue darkCyan darkGray darkGreen darkMagenta darkRed darkYellow green lightGray magenta none red white yellow)
      end

      def to_xml(xml)
        xml["w"].public_send(tag, "w:val" => value)
      end

    end
  end
end
