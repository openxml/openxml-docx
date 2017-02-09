require "openxml/docx/elements/word_processing_drawing_inline"
require "openxml/docx/elements/word_processing_drawing_anchor"
require "openxml/docx/elements/word_processing_drawing_simple_position"
require "openxml/docx/elements/word_processing_drawing_position_h"
require "openxml/docx/elements/word_processing_drawing_position_v"
require "openxml/docx/elements/word_processing_drawing_position_offset"
require "openxml/docx/elements/word_processing_drawing_extent"
require "openxml/docx/elements/word_processing_drawing_wrap_through"
require "openxml/docx/elements/word_processing_drawing_wrap_tight"
require "openxml/docx/elements/word_processing_drawing_wrap_polygon"
require "openxml/docx/elements/word_processing_drawing_wrap_square"
require "openxml/docx/elements/word_processing_drawing_wrap_top_and_bottom"
require "openxml/docx/elements/word_processing_drawing_wrap_none"
require "openxml/docx/elements/word_processing_drawing_wrap_coordinate"
require "openxml/docx/elements/word_processing_drawing_object_nv_properties"
require "openxml/drawingml/elements/graphic"

module OpenXml
  module Docx
    module Elements
      class Drawing < Container
        tag :drawing
        attr_reader :graphic

        def self.next_index
          @index = (@index || 0) + 1
        end

      private

        def build_scaffold
          inline = options.fetch(:anchor_type, :floating) == :inline
          width = options.fetch(:width, 0)
          height = options.fetch(:height, 0)
          wrap_type = options.fetch(:wrap_type, :none)
          x_pos, y_pos = options.fetch(:position, [0, 0])

          anchor = if inline
            OpenXml::Docx::Elements::WordProcessingDrawingInline.new
              .distance_from_bottom(0)
              .distance_from_top(0)
              .distance_from_left(0)
              .distance_from_right(0)
          else
            OpenXml::Docx::Elements::WordProcessingDrawingAnchor.new
              .distance_from_bottom(0)
              .distance_from_top(0)
              .distance_from_left(0)
              .distance_from_right(0)
              .allow_overlap(true)
              .behind_document(false)
              .layout_in_cell(true)
              .locked(false)
              .z_index(1000)
              .simple_position(false)
              .push(OpenXml::Docx::Elements::WordProcessingDrawingSimplePosition.new do |sp|
                sp.x = x_pos
                sp.y = y_pos
              end)
              .push(OpenXml::Docx::Elements::WordProcessingDrawingPositionH.new do |ph|
                ph.relative_from(:column)
                ph.push OpenXml::Docx::Elements::WordProcessingDrawingPositionOffset.new
                  .value(x_pos)
              end)
              .push(OpenXml::Docx::Elements::WordProcessingDrawingPositionV.new do |ph|
                ph.relative_from(:paragraph)
                ph.push OpenXml::Docx::Elements::WordProcessingDrawingPositionOffset.new
                  .value(y_pos)
              end)
          end

          anchor << OpenXml::Docx::Elements::WordProcessingDrawingExtent.new
            .extent_length(width)
            .extent_width(height)

          unless inline
            case wrap_type
            when :polygon
              coordinates = options.fetch(:wrap_coordinates, [[0,0], [0,height], [width, height], [width, 0]])
              wrap_margins = options.fetch(:wrap_margins, {})
              behavior_klass = options.fetch(:wrap_behavior, :tight) == :through ? OpenXml::Docx::Elements::WordProcessingDrawingWrapThrough : OpenXml::Docx::Elements::WordProcessingDrawingWrapTight
              anchor << behavior_klass.new do
                distance_from_left(wrap_margins.fetch(:left, 0))
                distance_from_right(wrap_margins.fetch(:right, 0))
                wrap_text(:bothSides)
                push(OpenXml::Docx::Elements::WordProcessingDrawingWrapPolygon.new do
                  coordinates.each_with_index do |(x, y), index|
                    coordinate_type = index == 0 ? :start : :lineTo
                    push OpenXml::Docx::Elements::WordProcessingDrawingWrapCoordinate.new(coordinate_type).x(x).y(y)
                  end
                end)
              end
            when :square
              wrap_margins = options.fetch(:wrap_margins, {})
              anchor << OpenXml::Docx::Elements::WordProcessingDrawingWrapSquare.new
                .distance_from_bottom(wrap_margins.fetch(:bottom, 0))
                .distance_from_left(wrap_margins.fetch(:left, 0))
                .distance_from_right(wrap_margins.fetch(:right, 0))
                .distance_from_top(wrap_margins.fetch(:top, 0))
                .wrap_text(:bothSides)
            when :top_and_bottom
              wrap_margins = options.fetch(:wrap_margins, {})
              anchor << OpenXml::Docx::Elements::WordProcessingDrawingWrapTopAndBottom.new
                .distance_from_bottom(wrap_margins.fetch(:bottom, 0))
                .distance_from_top(wrap_margins.fetch(:top, 0))
            else
              anchor << OpenXml::Docx::Elements::WordProcessingDrawingWrapNone.new
            end
          end

          anchor << OpenXml::Docx::Elements::WordProcessingDrawingObjectNvProperties.new
            .description(options[:filename] || options.fetch(:name, "Drawing"))
            .object_name(options.fetch(:name, "Drawing"))
            .id(self.class.next_index)

          @graphic = OpenXml::DrawingML::Elements::Graphic.new
          anchor << @graphic

          push(anchor)
        end

      end
    end
  end
end
