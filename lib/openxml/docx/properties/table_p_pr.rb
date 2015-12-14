module OpenXml
  module Docx
    module Properties
      class TablePPr < ComplexProperty
        tag :tblpPr

        with_namespace :w do
          attribute :bottomFromText, expects: :positive_integer
          attribute :horizAnchor, one_of: %i(margin page text)
          attribute :leftFromText, expects: :positive_integer
          attribute :rightFromText, expects: :positive_integer
          attribute :tblpX, expects: :integer
          attribute :tblpXSpec, one_of: %i(center inside left outside right)
          attribute :tblpY, expects: :integer
          attribute :tblpYSpec, one_of: %i(bottom center inline inside outside top)
          attribute :topFromText, expects: :positive_integer
          attribute :vertAnchor, one_of: %i(margin page text)
        end
      end
    end
  end
end
