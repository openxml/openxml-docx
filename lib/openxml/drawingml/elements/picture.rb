require "openxml/drawingml/elements/non_visual_picture_properties"
require "openxml/drawingml/elements/non_visual_drawing_properties"
require "openxml/drawingml/elements/non_visual_picture_drawing_properties"
require "openxml/drawingml/elements/picture_locks"
require "openxml/drawingml/elements/blip_fill"
require "openxml/drawingml/elements/blip"
require "openxml/drawingml/elements/stretch"
require "openxml/drawingml/elements/fill_rectangle"
require "openxml/drawingml/elements/source_rectangle"
require "openxml/drawingml/elements/picture_shape_properties"
require "openxml/drawingml/elements/transform_effect"
require "openxml/drawingml/elements/offset"
require "openxml/drawingml/elements/extents"
require "openxml/drawingml/elements/preset_geometry"
require "openxml/drawingml/elements/adjust_values_list"
require "openxml/drawingml/elements/no_fill"
require "openxml/drawingml/elements/outline"

module OpenXml
  module DrawingML
    module Elements
      class Picture < OpenXml::Docx::Elements::Container
        namespace :pic
        tag :pic

        def self.next_index
          @index = (@index || 0) + 1
        end

        private

          def build_scaffold
            image_rid = options[:image_rid]
            return unless image_rid

            picture_desc = options.fetch(:name, "Image")
            picture_name = options.fetch(:filename, picture_desc)
            width = options.fetch(:width, 0)
            height = options.fetch(:height, 0)

            # More non-visual Properties
            picture_index = self.class.next_index
            push(OpenXml::DrawingML::Elements::NonVisualPictureProperties.new do
              push OpenXml::DrawingML::Elements::NonVisualDrawingProperties.new
                .id(picture_index)
                .picture_name(picture_name)
                .description(picture_desc)
              push OpenXml::DrawingML::Elements::NonVisualPictureDrawingProperties.new
                .push(OpenXml::DrawingML::Elements::PictureLocks.new
                  .disallow_aspect_ratio_changes(true)
                  .disallow_arrowhead_changes(true))
            end)

            # The actual image
            push(OpenXml::DrawingML::Elements::BlipFill.new do
              push OpenXml::DrawingML::Elements::Blip.new
                .embed(image_rid)
              push OpenXml::DrawingML::Elements::Stretch.new
                .push(OpenXml::DrawingML::Elements::FillRectangle.new)
              push OpenXml::DrawingML::Elements::SourceRectangle.new
            end)

            # Shape Properties
            push(OpenXml::DrawingML::Elements::PictureShapeProperties.new do
              push(OpenXml::DrawingML::Elements::TransformEffect.new do
                push OpenXml::DrawingML::Elements::Offset.new
                  .x(0)
                  .y(0)
                push OpenXml::DrawingML::Elements::Extents.new
                  .extent_length(width)
                  .extent_width(height)
              end)
              push(OpenXml::DrawingML::Elements::PresetGeometry.new do
                preset(:rect)
                push OpenXml::DrawingML::Elements::AdjustValuesList.new
              end)
              push OpenXml::DrawingML::Elements::NoFill.new
              push OpenXml::DrawingML::Elements::Outline.new
                .push(OpenXml::DrawingML::Elements::NoFill.new)
            end)
          end

      end
    end
  end
end
