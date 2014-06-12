module Rocx
  module Properties
    class EastAsianLayout < ComplexProperty
      attribute :combine, expects: :on_or_off
      attribute :combine_brackets, expects: :valid_bracket
      attribute :id, expects: :integer
      attribute :vertical, expects: :on_or_off, displays_as: :vert
      attribute :vertical_compress, expects: :on_or_off, displays_as: :vertCompress

      VALID_BRACKETS = %i(angle curly none round square)

    private

      def valid_bracket(value)
        valid_in? value, VALID_BRACKETS
      end

    end
  end
end
