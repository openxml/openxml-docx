module Rocx
  module Properties
    class ToggleProperty < ValueProperty

      def ok_values
        [nil, true, false]
      end

      def to_xml(xml)
        xml["w"].public_send(tag) if value
      end

    end
  end
end
