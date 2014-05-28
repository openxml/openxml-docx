module Rocx
  module Properties
    class TextDirection < BaseProperty

      def ok_values
        %i(lr lrV rl rlV tb tbV)
      end

      def to_xml(xml)
        xml["w"].public_send(tag, "w:val" => value)
      end

    end
  end
end
