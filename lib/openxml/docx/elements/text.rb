module OpenXml
  module Docx
    module Elements
      class Text < Element
        attr_reader :text

        tag :t

        attribute :space, one_of: [:preserve, nil], namespace: :xml

        def initialize(text=nil)
          @text = text
        end

        def to_xml(xml)
          xml["w"].public_send(tag, text, xml_attributes)
        end
      end
    end
  end
end
