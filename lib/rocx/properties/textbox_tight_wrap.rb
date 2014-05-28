module Rocx
  module Properties
    class TextboxTightWrap < BaseProperty

      def ok_values
        %i(allLines firstAndLastLine firstLineOnly lastLineOnly none)
      end

      def to_xml(xml)
        xml["w"].public_send(tag, "w:val" => value)
      end

    end
  end
end
