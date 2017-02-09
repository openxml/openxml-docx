module OpenXml
  module DrawingML
    module Elements
      class GraphicData < OpenXml::Docx::Elements::Container
        namespace :a

        attribute :uri, expects: :string

        def self.data_types
          { picture: "http://schemas.openxmlformats.org/drawingml/2006/picture",
            wordprocessing_shape: "http://schemas.microsoft.com/office/word/2010/wordprocessingShape" }
        end

      end
    end
  end
end
