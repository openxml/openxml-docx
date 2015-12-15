module OpenXml
  module DrawingML
    module Elements
      class BlipFill < OpenXml::Docx::Elements::Container
        namespace :pic
        tag :blipFill

        attribute :dpi, expects: :integer
        attribute :rotWithShape, expects: :true_or_false

      end
    end
  end
end
