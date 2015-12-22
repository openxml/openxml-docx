module OpenXml
  module Docx
    module Properties
      class LatentStylesException < ComplexProperty
        tag :lsdException

        with_namespace :w do
          attribute :locked, expects: :boolean
          attribute :style_name, expects: :string, displays_as: :name
          attribute :qFormat, expects: :boolean
          attribute :semi_hidden, expects: :boolean, displays_as: :semiHidden
          attribute :ui_priority, expects: :integer, displays_as: :uiPriority
          attribute :unhide_when_used, expects: :boolean, displays_as: :unhideWhenUsed
        end


        def initialize(style_name)
          self.style_name = style_name
        end

      end
    end
  end
end
