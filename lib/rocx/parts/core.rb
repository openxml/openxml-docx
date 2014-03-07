module Rocx
  module Parts
    class Core < BasePart

      attr_accessor :title,
                    :subject,
                    :creator,
                    :keywords,
                    :revision,
                    :category,
                    :description,
                    :last_modified_by

      def initialize
        @title = ""
        @subject = ""
        @creator = ""
        @keywords = ""
        @revision = 1
        @category = ""
        @description = ""
        @last_modified_by = ""
      end

      def to_xml
        build_xml do |xml|
          xml.coreProperties(root_namespaces) {
            xml['dc'].title title
            xml['dc'].subject subject
            xml['dc'].creator creator
            xml['cp'].keywords keywords
            xml['cp'].lastModifiedBy last_modified_by
            xml['cp'].revision revision
            xml['cp'].category category
            xml['dc'].description description
            now = Time.now.strftime("%Y-%m-%dT%H:%M:%SZ")
            xml['dcterms'].created(now, {"xsi:type" => "dcterms:W3CDTF"})
            xml['dcterms'].modified(now, {"xsi:type" => "dcterms:W3CDTF"})
          }
        end
      end

    private

      def root_namespaces
        { "xmlns:cp" => "http://schemas.openxmlformats.org/package/2006/metadata/core-properties",
          "xmlns:dc" => "http://purl.org/dc/elements/1.1/",
          "xmlns:dcterms" => "http://purl.org/dc/terms/",
          "xmlns:dcmitype" => "http://purl.org/dc/dcmitype/",
          "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance" }
      end

    end
  end
end
