module OpenXml
  module Docx
    module Elements
      class Paragraph < Container
        attr_reader :section_properties
        tag :p

        value_property :alignment
        value_property :auto_adjust_right_indent
        value_property :auto_space_de
        value_property :auto_space_dn
        value_property :bidi
        value_property :compress_punctuation
        value_property :contextual_spacing
        value_property :div_id
        value_property :keep_lines
        value_property :keep_next
        value_property :mirror_indent
        value_property :outline_level
        value_property :overflow_punctuation
        value_property :page_break_before
        value_property :snap_to_grid
        value_property :paragraph_style
        value_property :supress_auto_hyphens
        value_property :supress_line_numbers
        value_property :supress_overlap
        value_property :textbox_tight_wrap
        value_property :text_alignment
        value_property :text_direction
        value_property :widow_control
        value_property :word_wrap

        property :borders, as: :paragraph_borders
        property :conditional_formatting
        property :frame
        property :indentation
        property :numbering
        property :shading
        property :spacing
        property :tabs

        def section_properties=(section)
          raise ArgumentError, "Section properties must be an instance of OpenXml::Docx::Section" unless section.is_a?(OpenXml::Docx::Section)
          @section_properties = section
        end

        def to_xml(xml)
          xml[namespace].public_send(tag, xml_attributes) {
            section_properties.to_xml(xml) unless section_properties.nil?
            property_xml(xml)
            children.each { |child| child.to_xml(xml) }
          }
        end

      end
    end
  end
end
