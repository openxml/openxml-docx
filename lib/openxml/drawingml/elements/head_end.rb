module OpenXml
  module DrawingML
    module Elements
      class HeadEnd < OpenXml::Docx::Elements::Element
        namespace :a

        attribute :length, one_of: %i(lg med sm), displays_as: :len
        attribute :type, one_of: %i(arrow diamond none oval stealth triangle)
        attribute :width, one_of: %i(lg med sm), displays_as: :w

      end
    end
  end
end
