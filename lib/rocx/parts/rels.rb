require "securerandom"

module Rocx
  module Parts
    class Rels < BasePart
      attr_reader :relationships

      def initialize
        @relationships = []
        install_defaults
      end

      def install_defaults
        defaults.each do |default|
          relationship *default.values
        end
      end

      def relationship(type, target, id=nil)
        id = "R#{SecureRandom.hex}" unless id
        relationships << {"Type" => type, "Target" => target, "Id" => id}
      end

      def read
        xml = build_xml do |xml|
          xml.Relationships(xmlns: "http://schemas.openxmlformats.org/package/2006/relationships") {
            relationships.each do |rel|
              xml.Relationship(rel)
            end
          }
        end
        strip_whitespace(xml)
      end

    private

      def defaults
        [{ type: "http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles",
           target: "/word/styles.xml",
           id: "Rf06246a95c004384" },
         { type: "http://schemas.openxmlformats.org/officeDocument/2006/relationships/settings",
           target: "/word/settings.xml",
           id: "R1efaa81aac7a4831" }]
      end

    end
  end
end
