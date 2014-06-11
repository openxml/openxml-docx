module Rocx
  module Properties
    class OnOffProperty < ValueProperty

      def ok_values
        [nil, :on, :off]
      end

      def to_xml(xml)
        xml["w"].public_send(tag, "w:val" => value) if value
      end

    end
  end
end
