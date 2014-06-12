module Rocx
  module Properties
    class Spacing < ComplexProperty
      VALID_LINE_RULES = %i(atLeast auto exact)

      attribute :after, expects: :positive_integer
      attribute :after_auto, expects: :on_or_off, displays_as: :afterAutospacing
      attribute :after_lines, expects: :integer
      attribute :before, expects: :positive_integer
      attribute :before_auto, expects: :on_or_off, displays_as: :beforeAutospacing
      attribute :before_lines, expects: :integer
      attribute :line, expects: :integer
      attribute :line_rule, expects: :valid_line_rule

    private

      def valid_line_rule(value)
        valid_in? value, VALID_LINE_RULES
      end

    end
  end
end
