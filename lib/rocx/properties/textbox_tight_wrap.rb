module Rocx
  module Properties
    class TextboxTightWrap < ValueProperty

      def ok_values
        %i(allLines firstAndLastLine firstLineOnly lastLineOnly none)
      end

    end
  end
end
