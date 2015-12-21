module OpenXml
  module DrawingML
    module Elements
      class BlipFill < OpenXml::Docx::Elements::Container
        namespace :pic
        tag :blipFill

        attribute :dpi, expects: :integer
        attribute :rotate_with_shape, expects: :boolean, displays_as: :rotWithShape

      end
    end
  end
end
