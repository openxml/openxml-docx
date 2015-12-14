module OpenXml
  module Docx
    module Properties
      class TrHeight < ComplexProperty

        attribute :hRule, one_of: %i(auto atLeast exact), namespace: :w
        attribute :val, expects: :positive_integer, namespace: :w

      end
    end
  end
end
