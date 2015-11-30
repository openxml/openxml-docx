module OpenXml
  module Docx
    module Elements
      class Text < Element
        attr_reader :text

        tag :t

        attribute :space, expects: :valid_space_preserve, namespace: :xml

        VALID_SPACE_PRESERVES = [:preserve, nil]

        def initialize(text=nil)
          @text = text
        end

        def to_xml(xml)
          xml["w"].public_send(tag, text, xml_attributes)
        end

      private

        def valid_space_preserve(value)
          valid_in? value, VALID_SPACE_PRESERVES
        end

      end
    end
  end
end
