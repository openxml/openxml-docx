module OpenXml
  module DrawingML
    module Elements
      class NonVisualShapeDrawingProperties < OpenXml::Docx::Elements::Container
        namespace :wps
        tag :cNvSpPr

        attribute :txBox, expects: :true_or_false
      end
    end
  end
end
