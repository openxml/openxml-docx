module Rocx
  module Properties
    class SectionType < ValueProperty
      tag :type
      name "type"

      def ok_values
        %i(continuous evenPage nextColumn nextPage oddPage)
      end

    end
  end
end
