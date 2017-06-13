module OpenXml
  module Docx
    module Elements
      class WordProcessingDrawingWrapCoordinate < OpenXml::Docx::Element
        namespace :wp

        attr_reader :tag

        attribute :x, expects: :integer
        attribute :y, expects: :integer

        def initialize(tag)
          raise ArgumentError, "Tag must be one of #{ok_tags.join(", ")}" unless ok_tags.include? tag
          @tag = tag
        end

      private

        def ok_tags
          %i(start lineTo)
        end

      end
    end
  end
end
