module OpenXml
  module Docx
    module Properties
      class BooleanProperty < ValueProperty

        def ok_values
          [nil, true, false]
        end

        def to_xml(xml)
          xml["w"].public_send(tag, "w:val" => value) if value
        end

      end
    end
  end
end
