module OpenXml
  module Docx
    module Elements
      class WordProcessingDrawingPositionOffset < OpenXml::Docx::Element
        tag :posOffset
        namespace :wp

        def <<(text)
          value << text if text.is_a? String
        end

        def value
          @value ||= ""
        end

        def value=(new_value)
          @value = new_value if new_value.is_a? String
        end

        def to_xml(xml)
          xml[namespace.to_s].public_send(tag, value, xml_attributes)
        end

      end
    end
  end
end
