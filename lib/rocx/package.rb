require "open_xml/package"

module Rocx
  class Package < OpenXml::Package
    attr_reader :document,
                :doc_rels,
                :settings,
                :styles

    content_types do
      default "png", TYPE_PNG
      override "/word/styles.xml", TYPE_STYLES
      override "/word/settings.xml", TYPE_SETTINGS
    end

    def initialize
      super

      rels.add_relationship REL_DOCUMENT, "/word/document.xml"
      @doc_rels = OpenXml::Parts::Rels.new([
        { type: REL_STYLES, target: "/word/styles.xml"},
        { type: REL_SETTINGS, target: "/word/settings.xml"}
      ])
      @settings = Rocx::Parts::Settings.new
      @styles = Rocx::Parts::Styles.new
      @document = Rocx::Parts::Document.new

      add_part "word/_rels/document.xml.rels", doc_rels
      add_part "word/document.xml", document
      add_part "word/settings.xml", settings
      add_part "word/styles.xml", styles
    end

  end
end
