module OpenXml
  module DrawingML
    module Elements
      class NonVisualShapeDrawingProperties < OpenXml::Docx::Elements::Container
        namespace :wps
        tag :cNvSpPr

        attribute :txBox, expects: :boolean
      end
    end
  end
end
