module OpenXml
  module Docx
    module Properties
      class LatentStylesException < ComplexProperty
        tag :lsdException

        attribute :locked, expects: :true_or_false
        attribute :style_name, expects: :string, displays_as: :name
        attribute :qFormat, expects: :true_or_false
        attribute :semi_hidden, expects: :true_or_false, displays_as: :semiHidden
        attribute :ui_priority, expects: :integer, displays_as: :uiPriority
        attribute :unhide_when_used, expects: :true_or_false, displays_as: :unhideWhenUsed

        def initialize(style_name)
          self.style_name = style_name
        end

      end
    end
  end
end
