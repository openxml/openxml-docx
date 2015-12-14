module OpenXml
  module Docx
    module Parts
      class Styles < OpenXml::Part
        include RootNamespaces

        use_namespaces :r, :w

        attr_reader :styles

        def initialize
          @styles = []
        end

        def <<(style)
          @styles << style
        end

        def to_xml
          build_standalone_xml do |xml|
            xml.styles(root_namespaces) {
              xml.parent.namespace = :w
              add_default_styles(xml)
              styles.each { |style| style.to_xml(xml) }
            }
          end
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

      end
    end
  end
end
