module OpenXml
  module Docx
    module Elements
      class WordProcessingShapesShape < Container
        tag :wsp
        namespace :wps
        attribute :normal_east_asian_flow, expects: :boolean, displays_as: :normalEastAsianFlow

        attr_reader :text_content

      private

        def build_scaffold
          width = options.fetch(:width, 0)
          height = options.fetch(:height, 0)
          textbox = options.fetch(:textbox, false)
          shape_preset = options.fetch(:shape_preset, :rect)

          push OpenXml::DrawingML::Elements::NonVisualShapeDrawingProperties.new
            .textbox(textbox)
          push(OpenXml::Docx::Elements::WordProcessingShapesShapeProperties.new do
            push(OpenXml::DrawingML::Elements::TransformEffect.new do
              push OpenXml::DrawingML::Elements::Offset.new
                .x(0)
                .y(0)
              push OpenXml::DrawingML::Elements::Extents.new
                .extent_length(width)
                .extent_width(height)
            end)
            push OpenXml::DrawingML::Elements::PresetGeometry.new
              .preset(shape_preset)
              .push(OpenXml::DrawingML::Elements::AdjustValuesList.new)
            push OpenXml::DrawingML::Elements::NoFill.new
            push OpenXml::DrawingML::Elements::Outline.new
              .push(OpenXml::DrawingML::Elements::NoFill.new)
          end)

          if textbox
            @text_content = OpenXml::Docx::Elements::TextboxContent.new
            push OpenXml::Docx::Elements::WordProcessingShapesTextualContent.new
              .push(@text_content)
          end

          push OpenXml::Docx::Elements::WordProcessingShapesBodyProperties.new
            .rotation(0)
            .paragraph_spacing(false)
            .vertical_overflow(:overflow)
            .horizontal_overflow(:overflow)
            .vertical(:horz)
            .wrap(:square)
            .number_of_columns(1)
            .anchor(:t)
            .anchor_center(false)
            .force_anti_alias(false)
            .compatible_line_spacing(true)
            .push(OpenXml::DrawingML::Elements::PresetTextWarp.new
              .preset(:textNoShape)
              .push(OpenXml::DrawingML::Elements::AdjustValuesList.new))
        end

      end
    end
  end
end

