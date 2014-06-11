module Rocx
  module Properties
    class TextAlignment < ValueProperty

      def ok_values
        %i(auto baseline bottom center top)
      end

    end
  end
end
