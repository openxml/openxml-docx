module Rocx
  module Properties
    class PhoneticGuideAlignment < ValueProperty
      tag :rubyAlign
      name "alignment"

      def ok_values
        %i(center distributeLetter distributeSpace left right rightVertical)
      end

    end
  end
end
