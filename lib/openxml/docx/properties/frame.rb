module OpenXml
  module Docx
    module Properties
      class Frame < ComplexProperty
        tag :framePr

        with_namespace :w do
          attribute :anchor_lock, expects: :true_or_false
          attribute :drop_cap, one_of: %i(drop margin none)
          attribute :height, expects: :positive_integer, displays_as: :h
          attribute :height_rule, one_of: %i(atLeast auto exact), displays_as: :hRule
          attribute :horizontal_anchor, one_of: %i(margin page text), displays_as: :hAnchor
          attribute :horizontal_padding, expects: :positive_integer, displays_as: :hSpace
          attribute :horizontal_position, expects: :integer, displays_as: :x
          attribute :lines, expects: :positive_integer
          attribute :relative_horizontal_position, one_of: %i(center inside left outside right), displays_as: :xAlign
          attribute :relative_vertical_position, one_of: %i(bottom center inline inside outside top), displays_as: :yAlign
          attribute :vertical_anchor, one_of: %i(margin page text), displays_as: :vAnchor
          attribute :vertical_padding, expects: :positive_integer, displays_as: :vSpace
          attribute :vertical_position, expects: :integer, displays_as: :y
          attribute :width, expects: :positive_integer, displays_as: :w
          attribute :wrap, one_of: %i(around auto none notBeside through tight)
        end

      end
    end
  end
end
