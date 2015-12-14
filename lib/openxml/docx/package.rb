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

      def embed_truetype_font(path: nil, name: nil)
        File.open(path, "rb") do |source_font|
          obfuscation_data = obfuscate_font source_font
          data = obfuscation_data[:bytes] << source_font.read
          destination_font_name = "font#{fonts.fonts.count + 1}.odttf"
          add_part "word/fonts/#{destination_font_name}", OpenXml::Parts::UnparsedPart.new(data)
          font_relationship = font_rels.add_relationship REL_FONT, "fonts/#{destination_font_name}"

          font_description = OpenXml::Docx::Elements::Font.new
          font_description.font_name = name
          embed_tag = OpenXml::Docx::Elements::EmbedRegular.new
          embed_tag.font_key = "{#{obfuscation_data[:key]}}"
          embed_tag.relationship_id = font_relationship.id
          font_description << embed_tag
          fonts << font_description
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

    private

      def obfuscate_font(font)
        # From the OpenXml spec, section 17.8.1, the algorithm for obfuscating a font:
        # - Generate a GUID, which is used and stored as the obfuscation key
        # - Reverse the order of the bytes in the GUID (i.e. Big Endian ordering)
        # - XOR the value with the first 32 bytes of the binary: once against 0-15, once against 16-31
        # - Store the resulting file in the document, and store the obfuscation key in the fontKey attribute

        key = SecureRandom::uuid.upcase # Spec requires hex characters be uppercase
        raw_key = key.gsub("-", "")
        big_endian_key = [raw_key].pack("H*").bytes.reverse
        obfuscated_bytes = []
        2.times do
          bytes = font.read(16).bytes
          (0...16).each do |index|
            obfuscated_bytes << (bytes[index] ^ big_endian_key[index])
          end
        end

        { key: key, bytes: obfuscated_bytes.pack("C*") }
      end

    end
  end
end
