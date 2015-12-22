module OpenXml
  module DrawingML
    module Elements
      class ChildrenOffset < OpenXml::Docx::Elements::Element
        namespace :a
        tag :chOff

        attribute :x, expects: :integer
        attribute :y, expects: :integer

      end
    end
  end
end
