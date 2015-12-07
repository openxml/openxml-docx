module OpenXml
  module Docx
    module Parts
      class Fonts < OpenXml::Part
        attr_reader :fonts

        def initialize
          @fonts = []
        end

        def <<(font)
          @fonts << font
        end

        def to_xml
          build_standalone_xml do |xml|
            xml.fonts(root_namespaces) {
              xml.parent.namespace = xml.parent.namespace_definitions.find { |ns| ns.prefix == "w" }
              fonts.each { |font| font.to_xml(xml) }
            }
          end
        end

      private

        def root_namespaces
          { "xmlns:r" => "http://schemas.openxmlformats.org/officeDocument/2006/relationships",
            "xmlns:w" => "http://schemas.openxmlformats.org/wordprocessingml/2006/main" }
        end

      end
    end
  end
end
