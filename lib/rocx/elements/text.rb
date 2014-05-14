module Rocx
  module Elements
    class Text < Element
      attr_reader :text

      def initialize(text, properties={})
        super properties
        @text = text
      end

      def <<(string)
        text << string
      end

      def to_xml(xml)
        xml["w"].send tag, text, properties
      end

    private

      def tag
        :t
      end

    end
  end
end
