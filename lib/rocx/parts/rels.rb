module Rocx
  module Parts
    class Rels < BasePart
      attr_reader :relationships

      def initialize
        @relationships = %w{numbering styles settings webSettings fontTable theme}
      end

      def to_xml
        build_xml do |xml|
          xml.Relationships(xmlns: "http://schemas.openxmlformats.org/package/2006/relationships") {
            relationship_attributes.each do |rel|
              xml.Relationship(rel)
            end
          }
        end
      end

    private

      def relationship_attributes
        relationships.each_with_index.map do |rel, index|
          attrs = {
            "Id" => "rId#{index + 1}",
            "Type" => "http://schemas.openxmlformats.org/officeDocument/2006/relationships/#{rel}",
            "Target" => rel == "theme" ? "theme/theme1.xml" : "#{rel}.xml"
          }
        end
      end

    end
  end
end
