require "open_xml/package"

module Rocx
  class Package < OpenXml::Package
    attr_reader :document,
                :doc_rels,
                :settings,
                :styles

    content_types do
      default "png", "image/png"
      override "/word/styles.xml", "application/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml"
      override "/word/settings.xml", "application/vnd.openxmlformats-officedocument.wordprocessingml.settings+xml"
    end

    def initialize
      super

      rels.add_relationship "http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument", "/word/document.xml"
      @doc_rels = OpenXml::Parts::Rels.new([
        { type: "http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles",
           target: "/word/styles.xml"},
        { type: "http://schemas.openxmlformats.org/officeDocument/2006/relationships/settings",
          target: "/word/settings.xml"}
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
