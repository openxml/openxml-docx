module OpenXml
  module Docx
    module Properties
      class TablePPr < ComplexProperty
        tag :tblpPr

        with_namespace :w do
          attribute :bottomFromText, expects: :positive_integer
          attribute :horizAnchor, expects: :valid_anchor
          attribute :leftFromText, expects: :positive_integer
          attribute :rightFromText, expects: :positive_integer
          attribute :tblpX, expects: :integer
          attribute :tblpXSpec, expects: :valid_x_spec
          attribute :tblpY, expects: :integer
          attribute :tblpYSpec, expects: :valid_y_spec
          attribute :topFromText, expects: :positive_integer
          attribute :vertAnchor, expects: :valid_anchor
        end

      private

        def valid_anchor(value)
          list = %i(margin page text)
          message = "Invalid #{name}: must be one of #{list.join(", ")} (was #{value.inspect})"
          raise ArgumentError, message unless list.include? value
        end

        def valid_x_spec(value)
          list = %i(center inside left outside right)
          message = "Invalid #{name}: must be one of #{list.join(", ")} (was #{value.inspect})"
          raise ArgumentError, message unless list.include? value
        end

        def valid_y_spec(value)
          list = %i(bottom center inline inside outside top)
          message = "Invalid #{name}: must be one of #{list.join(", ")} (was #{value.inspect})"
          raise ArgumentError, message unless list.include? value
        end

      end
    end
  end
end
