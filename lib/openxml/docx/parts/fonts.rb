module OpenXml
  module Docx
    module Parts
      class Fonts < OpenXml::Part
        include RootNamespaces

        attr_reader :fonts, :relationships

        use_namespaces :r, :w

        def initialize
          @fonts = []
          @relationships = OpenXml::Parts::Rels.new
        end

        def <<(font)
          @fonts << font
        end

        def count
          fonts.count
        end

        def to_xml
          build_standalone_xml do |xml|
            xml.fonts(root_namespaces) {
              xml.parent.namespace = :w
              fonts.each { |font| font.to_xml(xml) }
            }
          end
        end

      end
    end
  end
end
