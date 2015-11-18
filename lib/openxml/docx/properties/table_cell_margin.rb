module OpenXml
  module Docx
    module Properties
      class TableCellMargin < WidthProperty
        attr_accessor :tag

        attribute :type, expects: :valid_width_type
        attribute :width, expects: :positive_integer, displays_as: :w

        def initialize(tag)
          @tag = tag
          raise ArgumentError, invalid_tag_message unless valid_tag? tag
        end

      private

        def valid_tag?(value)
          ok_tags.include? value
        end

        def invalid_tag_message
          "Invalid value for #{name}; acceptable values are #{ok_tags.join(", ")} (provided: #{tag.inspect})"
        end

        def ok_tags
          %i(top start bottom end)
        end

      end
    end
  end
end
