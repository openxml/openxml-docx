module Rocx
  module Properties
    class VerticalTextAlignment < ValueProperty
      tag :vAlign

      def ok_values
        %i(both bottom center top)
      end

    end
  end
end
