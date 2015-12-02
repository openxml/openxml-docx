module OpenXml
  module Docx
    module Properties
      class TableRowHeight < ComplexProperty
        tag :trHeight

        attribute :hRule, expects: :valid_hrule, namespace: :w
        attribute :val, expects: :positive_integer, namespace: :w

      private
        def valid_hrule(value)
          list = %i(auto atLeast exact)
          message = "Invalid #{name}: must be one of #{list.join(", ")} (was #{value.inspect})"
          raise ArgumentError, message unless list.include? value
        end

      end
    end
  end
end
