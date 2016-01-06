module OpenXml
  module DrawingML
    module Elements
      class NonVisualShapeDrawingProperties < OpenXml::Docx::Elements::Container
        namespace :wps
        tag :cNvSpPr

        attribute :textbox, expects: :boolean, displays_as: :txBox
      end
    end
  end
end
