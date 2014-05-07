module Rocx
  module Parts
    class Styles < BasePart
      attr_reader :styles

      def initialize
        @styles = []
      end

      def <<(style)
        @styles << style
      end

      def read
        xml = build_standalone_xml do |xml|
          xml.styles(root_namespaces) {
            xml.parent.namespace = xml.parent.namespace_definitions.find { |ns| ns.prefix == "w" }
            add_default_styles(xml)
            styles.each { |style| style.build_xml(xml) }
          }
        end
        strip_whitespace(xml)
      end

    private

      def add_default_styles(xml)
        xml["w"].docDefaults {
          xml["w"].rPrDefault {
            xml["w"].rPr {
              xml["w"].lang("w:bidi" => "ar-SA", "w:eastAsia" => "en-US", "w:val" => "en-US")
            }
          }
          xml["w"].pPrDefault {
            xml["w"].pPr {
              xml["w"].spacing("w:after" => "0", "w:line" => "240", "w:lineRule" => "auto")
            }
          }
        }
      end

      def root_namespaces
        { "xmlns:r" => "http://schemas.openxmlformats.org/officeDocument/2006/relationships",
          "xmlns:w" => "http://schemas.openxmlformats.org/wordprocessingml/2006/main" }
      end

    end
  end
end
