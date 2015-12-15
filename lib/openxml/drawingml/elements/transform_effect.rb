module OpenXml
  module DrawingML
    module Elements
      class TransformEffect < OpenXml::Docx::Elements::Container
        namespace :a
        tag :xfrm

        attribute :horizontal_skew, expects: :integer, displays_as: :kx
        attribute :vertical_skew, expects: :integer, displays_as: :ky
        attribute :horizontal_ratio, expects: :percentage, displays_as: :sx
        attribute :vertical_ratio, expects: :percentage, displays_as: :sy
        attribute :horizontal_shift, expects: :integer, displays_as: :tx
        attribute :vertical_shift, expects: :integer, displays_as: :ty

      end
    end
  end
end
