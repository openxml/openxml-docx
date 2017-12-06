module OpenXml
  module Docx
    module Parts
      class Numbering < OpenXml::Part
        include RootNamespaces

        attr_reader :abstractNumbers, :numbers

        use_namespaces :w

        def initialize
          @abstractNumbers = []
          @numbers = []
          @relationships = OpenXml::Parts::Rels.new
        end

        def <<(child)
          if child.is_a?(OpenXml::Docx::Elements::AbstractNumber)
            abstractNumbers << child
          elsif child.is_a?(OpenXml::Docx::Elements::Number)
            numbers << child
          end
        end

        def count
          abstractNums.count
        end

        def to_xml
          build_standalone_xml do |xml|
            xml.numbering(root_namespaces) {
              xml.parent.namespace = :w
              abstractNumbers.each { |num| num.to_xml(xml) }
              numbers.each { |number| number.to_xml(xml) }
            }
          end
        end

      end
    end
  end
end
