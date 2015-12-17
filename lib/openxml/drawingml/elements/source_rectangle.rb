module OpenXml
  module DrawingML
    module Elements
      class SourceRectangle < OpenXml::Docx::Elements::Element
        namespace :a
        tag :srcRect

        attribute :bottom_offset, expects: :percentage, displays_as: :b
        attribute :left_offset, expects: :percentage, displays_as: :l
        attribute :right_offset, expects: :percentage, displays_as: :r
        attribute :top_offset, expects: :percentage, displays_as: :t

      end
    end
  end
end
