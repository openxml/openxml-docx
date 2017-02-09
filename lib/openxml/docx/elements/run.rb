require "openxml/docx/elements/text"

module OpenXml
  module Docx
    module Elements
      class Run < Container
        tag :r

        value_property :bold
        value_property :caps
        value_property :character_spacing
        value_property :complex_bold
        value_property :complex_font_size
        value_property :complex_italics
        value_property :complex_script_formatting
        value_property :double_strikethrough
        value_property :effect
        value_property :emboss
        value_property :emphasis
        value_property :expansion
        value_property :font_size
        value_property :hidden_text
        value_property :highlight
        value_property :kerning
        value_property :imprint
        value_property :italics
        value_property :math
        value_property :no_proof
        value_property :outline
        value_property :position
        value_property :right_to_left
        value_property :run_style
        value_property :shadow
        value_property :small_caps
        value_property :snap_to_grid
        value_property :spec_vanish
        value_property :strikethrough
        value_property :vertical_alignment
        value_property :web_hidden

        property :border
        property :color
        property :font
        property :east_asian_layout
        property :language
        property :manual_width
        property :shading
        property :underline

        def initialize(text=nil, options={})
          # More performant than &block: http://mudge.name/2011/01/26/passing-blocks-in-ruby-without-block.html
          block_given? ? super(options, &Proc.new) : super(options)
          push OpenXml::Docx::Elements::Text.new(text).space(options.fetch(:text_spacing, :preserve)) unless text.nil?
        end

      end
    end
  end
end
