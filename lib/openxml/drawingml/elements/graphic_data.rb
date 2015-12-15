module OpenXml
  module DrawingML
    module Elements
      class GraphicData < OpenXml::Docx::Elements::Container
        namespace :a

        attribute :uri, expects: :string

      end
    end
  end
end
