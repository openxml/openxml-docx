require "openxml/package"

module OpenXml
  module Docx
    class Package < OpenXml::Package
      attr_reader :document,
                  :doc_rels,
                  :font_rels,
                  :settings,
                  :headers,
                  :footers,
                  :styles,
                  :fonts

      content_types do
        default "xml", TYPE_XML
        default "odttf", TYPE_OBSCURED_FONT
        override "/word/styles.xml", TYPE_STYLES
        override "/word/settings.xml", TYPE_SETTINGS
        override "/word/fontTable.xml", TYPE_FONT_TABLE
      end

      def initialize
        super

        rels.add_relationship REL_DOCUMENT, "/word/document.xml"
        @doc_rels = OpenXml::Parts::Rels.new
        @font_rels = OpenXml::Parts::Rels.new
        @settings = OpenXml::Docx::Parts::Settings.new
        @styles = OpenXml::Docx::Parts::Styles.new
        @fonts = OpenXml::Docx::Parts::Fonts.new
        @document = OpenXml::Docx::Parts::Document.new
        @headers = []
        @footers = []

        doc_rels.add_relationship REL_STYLES, "styles.xml"
        doc_rels.add_relationship REL_SETTINGS, "settings.xml"
        doc_rels.add_relationship REL_FONT_TABLE, "fontTable.xml"

        add_part "word/_rels/document.xml.rels", doc_rels
        add_part "word/_rels/fontTable.xml.rels", font_rels
        add_part "word/document.xml", document
        add_part "word/settings.xml", settings
        add_part "word/styles.xml", styles
        add_part "word/fontTable.xml", fonts
      end

      end

      def add_header(header)
        headers << header
        header_name = "header#{headers.count}.xml"
        Package.content_types { override "/word/#{header_name}", TYPE_HEADER }
        add_part "word/#{header_name}", header
        relationship = doc_rels.add_relationship REL_HEADER, header_name
        relationship.id
      end

      def add_footer(footer)
        footers << footer
        footer_name = "footer#{footers.count}.xml"
        Package.content_types { override "/word/#{footer_name}", TYPE_FOOTER }
        add_part "word/#{footer_name}", footer
        relationship = doc_rels.add_relationship REL_FOOTER, footer_name
        relationship.id
      end

    end
  end
end
