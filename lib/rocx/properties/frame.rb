module Rocx
  module Properties
    class Frame < ComplexProperty
      include AttributeBuilder

      tag :framePr

      VALID_ANCHORS = %i(margin page text)
      VALID_DROP_CAPS = %i(drop margin none)
      VALID_HEIGHT_RULES = %i(atLeast auto exact)
      VALID_RELATIVE_HORIZONTAL_POSITIONS = %i(center inside left outside right)
      VALID_RELATIVE_VERTICAL_POSITIONS = %i(bottom center inline inside outside top)
      VALID_WRAPS = %i(around auto none notBeside through tight)

      attribute :anchor_lock, expects: :true_or_false
      attribute :drop_cap, expects: :valid_drop_cap
      attribute :height, expects: :positive_integer, displays_as: :h
      attribute :height_rule, expects: :valid_height_rule, displays_as: :hRule
      attribute :horizontal_anchor, expects: :valid_anchor, displays_as: :hAnchor
      attribute :horizontal_padding, expects: :positive_integer, displays_as: :hSpace
      attribute :horizontal_position, expects: :integer, displays_as: :x
      attribute :lines, expects: :positive_integer
      attribute :relative_horizontal_position, expects: :valid_relative_horizontal_position, displays_as: :xAlign
      attribute :relative_vertical_position, expects: :valid_relative_vertical_position, displays_as: :yAlign
      attribute :vertical_anchor, expects: :valid_anchor, displays_as: :vAnchor
      attribute :vertical_padding, expects: :positive_integer, displays_as: :vSpace
      attribute :vertical_position, expects: :integer, displays_as: :y
      attribute :width, expects: :positive_integer, displays_as: :w
      attribute :wrap, expects: :valid_wrap

    private

      def valid_drop_cap(value)
        valid_in? value, VALID_DROP_CAPS
      end

      def valid_anchor(value)
        valid_in? value, VALID_ANCHORS
      end

      def valid_height_rule(value)
        valid_in? value, VALID_HEIGHT_RULES
      end

      def valid_relative_horizontal_position(value)
        valid_in? value, VALID_RELATIVE_HORIZONTAL_POSITIONS
      end

      def valid_relative_vertical_position(value)
        valid_in? value, VALID_RELATIVE_VERTICAL_POSITIONS
      end

      def valid_wrap(value)
        valid_in? value, VALID_WRAPS
      end

    end
  end
end
