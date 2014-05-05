module Rocx
  module Parts
    class GlobalRels < BasePart

      def read
        xml = build_xml do |xml|
          xml.Relationships(xmlns: "http://schemas.openxmlformats.org/package/2006/relationships") {
            xml.Relationship(document_relation_attributes)
          }
        end
        strip_whitespace(xml)
      end

    private

      def document_relation_attributes
        { "Type" => "http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument",
          "Target" => "/word/document.xml",
          "Id" => "R08806881ac3c45ac" }
      end

    end
  end
end
