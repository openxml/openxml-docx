require "openxml/package"

module OpenXml
  module Docx
    class Package < OpenXml::Package
      attr_reader :document,
                  :doc_rels,
                  :settings,
                  :styles

      content_types do
        default "xml", TYPE_XML
        override "/word/styles.xml", TYPE_STYLES
        override "/word/settings.xml", TYPE_SETTINGS
      end

      def initialize
        super

        rels.add_relationship REL_DOCUMENT, "/word/document.xml"
        @doc_rels = OpenXml::Parts::Rels.new
        @settings = OpenXml::Docx::Parts::Settings.new
        @styles = OpenXml::Docx::Parts::Styles.new
        @document = OpenXml::Docx::Parts::Document.new
        @styles << default_table_style

        doc_rels.add_relationship REL_STYLES, "styles.xml"
        doc_rels.add_relationship REL_SETTINGS, "settings.xml"

        add_part "word/_rels/document.xml.rels", doc_rels
        add_part "word/document.xml", document
        add_part "word/settings.xml", settings
        add_part "word/styles.xml", styles
      end

    private

      def default_table_style
        style = OpenXml::Docx::Style.new(:table)
        style.id = "TableGrid"

        table_grid_tags.each do |tag_name|
          tag = OpenXml::Docx::Properties::TableBorder.new(tag_name, :single)
          table_border_styles = {width: 4, space: 0, color: "000000"}
          table_border_styles.each {|key, val| tag.send("#{key}=", val) }
          style.table.table_borders <<  tag
        end

        table_cell_margin_tags.each do |tag_name|
          tag = OpenXml::Docx::Properties::TableCellMargin.new(tag_name)
          tag.type = :dxa
          tag.width = %i(start end).include?(tag_name) ? 108 : 0
          style.table.table_cell_margins << tag
        end

        style
      end

      def table_grid_tags
        %i(start end top bottom insideH insideV)
      end

      def table_cell_margin_tags
        %i(top start bottom end)
      end
    end
  end
end
