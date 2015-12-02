module OpenXml
  module DrawingML
    module Elements
      class Offset < OpenXml::Docx::Elements::Element
        namespace :a
        tag :off

        attribute :x, expects: :integer
        attribute :y, expects: :integer

      end
    end
  end
end
