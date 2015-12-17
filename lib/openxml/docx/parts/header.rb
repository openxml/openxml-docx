module OpenXml
  module Docx
    module Parts
      class Header < OpenXml::Part
        include RootNamespaces

        use_namespaces :wpc, :mo, :mv, :o, :r, :m, :v, :wp14, :wp, :w10, :w14, :w15, :wpg, :wpi, :wne, :wps, :w, :mc, :a, :a14
        can_ignore :w14, :w15, :wp14, :a14

        attr_reader :children, :relationships

        def initialize
          @children = []
          @relationships = OpenXml::Parts::Rels.new
        end

        def <<(child)
          children << child
        end

        def to_xml
          build_xml do |xml|
            xml.hdr(root_namespaces) {
              xml.parent.namespace = :w
              children.each { |child| child.to_xml(xml) }
            }
          end
        end

      end
    end
  end
end
