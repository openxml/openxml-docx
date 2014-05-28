require "open_xml_package"

module Rocx
  class Package
    attr_reader :content_types,
                :document,
                :global_rels,
                :rels,
                :settings,
                :styles

    def initialize
      @content_types = Rocx::Parts::ContentTypes.new
      @document = Rocx::Parts::Document.new
      @global_rels = Rocx::Parts::GlobalRels.new
      @rels = Rocx::Parts::Rels.new
      @settings = Rocx::Parts::Settings.new
      @styles = Rocx::Parts::Styles.new
    end

    def save(path)
      package = OpenXmlPackage.new
      package.add_part "_rels/.rels", global_rels
      package.add_part "[Content_Types].xml", content_types
      package.add_part "word/_rels/document.xml.rels", rels
      package.add_part "word/document.xml", document
      package.add_part "word/settings.xml", settings
      package.add_part "word/styles.xml", styles
      package.write_to path
    end

  end
end
