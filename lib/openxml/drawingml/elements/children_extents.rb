module OpenXml
  module DrawingML
    module Elements
      class ChildrenExtents < OpenXml::Docx::Elements::Element
        namespace :a
        tag :chExt

        attribute :extent_length, expects: :positive_integer, displays_as: :cx
        attribute :extent_width, expects: :positive_integer, displays_as: :cy

      end
    end
  end
end
