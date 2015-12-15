module OpenXml
  module Docx
    module Properties
      class TableRowHeight < ComplexProperty
        tag :trHeight

        attribute :hRule, one_of: %i(auto atLeast exact), namespace: :w
        attribute :val, expects: :positive_integer, namespace: :w

      end
    end
  end
end
