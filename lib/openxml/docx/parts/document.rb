module OpenXml
  module Docx
    module Parts
      class Document < OpenXml::Part
        include RootNamespaces

        attr_reader :children, :current_section, :relationships

        use_namespaces :wpc, :mo, :mv, :o, :r, :m, :v, :wp14, :wp, :w10, :w14, :wpg, :wpi, :wne, :wps, :w, :mc, :a, :a14, :pic
        can_ignore :w14, :wp14, :a14

        def initialize
          @children = []
          @relationships = OpenXml::Parts::Rels.new
        end

        def <<(child)
          if child.is_a?(OpenXml::Docx::Section)
            set_section(child)
          else
            children << child
          end
        end

        def set_section(section)
          if current_section.nil?
            @current_section = section
          else
            children.last.section_properties = current_section
            @current_section = section
          end
        end

        def background
          @background ||= OpenXml::Docx::Elements::Background.new
        end

        def to_xml
          build_xml do |xml|
            xml.document(root_namespaces) {
              xml.parent.namespace = :w
              background.to_xml(xml) unless @background.nil?
              xml["w"].body {
                children.each { |child| child.to_xml(xml) }
                current_section.to_xml(xml) unless current_section.nil?
              }
            }
          end
        end

      end
    end
  end
end
