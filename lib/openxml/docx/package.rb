require "open_xml/package"

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

        add_part "word/_rels/document.xml.rels", doc_rels
        add_part "word/document.xml", document
        add_part "word/settings.xml", settings
        add_part "word/styles.xml", styles
      end

    end
  end
end
