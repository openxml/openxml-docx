require "openxml/docx/properties/column"

module OpenXml
  module Docx
    module Properties
      class Columns < ContainerProperty
        tag :cols
        child_class :column

        with_namespace :w do
          attribute :equal_width, expects: :true_or_false
          attribute :number, expects: :integer, displays_as: :num
          attribute :separator, expects: :true_or_false, displays_as: :sep
          attribute :space, expects: :integer
        end

        def render?
          attributes = %i(equal_width number separator space)
          attributes.each do |attribute|
            return true unless self.send(attribute).nil?
          end
          super

        end

      end
    end
  end
end
