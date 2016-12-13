module OpenXml
  module Docx
    module Properties
      class ExplicitToggleProperty < ToggleProperty

        def to_xml(xml)
          return if value.nil?
          return xml["w"].public_send(tag, "w:val" => value) if value == false
          xml["w"].public_send(tag)
        end

      end
    end
  end
end
