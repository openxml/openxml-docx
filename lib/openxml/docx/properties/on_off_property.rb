module OpenXml
  module Docx
    module Properties
      class OnOffProperty < ValueProperty

        def ok_values
          [true, false, :on, :off] # :on and :off are from the Transitional Spec
        end

        def to_xml(xml)
          return xml["w"].public_send(tag) if value == true
          xml["w"].public_send(tag, "w:val" => value)
        end

      end
    end
  end
end
