module OpenXml
  module DrawingML
    module Elements
      class SRGBColor < OpenXml::Docx::Elements::Element
        namespace :a
        tag :srgbClr
        name "srgb_color"

        attribute :value, expects: :hex_color, displays_as: :val

      end
    end
  end
end
