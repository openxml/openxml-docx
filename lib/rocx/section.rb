module Rocx
  class Section
    include PropertyBuilder

    properties_tag :sectPr

    property :columns
    property :document_grid
    property :line_numbering
    property :page_borders
    property :page_margins
    property :page_numbering
    property :page_size
    property :paper_source

    value_property :bidi
    value_property :form_protection
    value_property :rtl_gutter
    value_property :text_direction
    value_property :type, as: :section_type
    value_property :vertical_alignment, as: :vertical_text_alignment

    def to_xml(xml)
      property_xml xml
    end

  private

    def namespace
      :w
    end

  end
end
