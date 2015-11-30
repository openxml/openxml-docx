module OpenXml
  module Docx
    module Parts
      class Document < OpenXml::Part
        attr_reader :children, :current_section

        def initialize
          @children = []
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

        def to_xml
          build_xml do |xml|
            xml.document(root_namespaces) {
              xml.parent.namespace = xml.parent.namespace_definitions.find { |ns| ns.prefix == "w" }
              xml["w"].body {
                children.each { |child| child.to_xml(xml) }
                current_section.to_xml(xml) unless current_section.nil?
              }
            }
          end
        end

      private

        def root_namespaces
          { "xmlns:wpc" => 'http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas',
            "xmlns:mo" => 'http://schemas.microsoft.com/office/mac/office/2008/main',
            "xmlns:mv" => 'urn:schemas-microsoft-com:mac:vml',
            "xmlns:o" => 'urn:schemas-microsoft-com:office:office',
            "xmlns:r" => 'http://schemas.openxmlformats.org/officeDocument/2006/relationships',
            "xmlns:m" => 'http://schemas.openxmlformats.org/officeDocument/2006/math',
            "xmlns:v" => 'urn:schemas-microsoft-com:vml',
            "xmlns:wp14" => 'http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing',
            "xmlns:wp" => 'http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing',
            "xmlns:w10" => 'urn:schemas-microsoft-com:office:word',
            "xmlns:w14" => 'http://schemas.microsoft.com/office/word/2010/wordml',
            "xmlns:wpg" => 'http://schemas.microsoft.com/office/word/2010/wordprocessingGroup',
            "xmlns:wpi" => 'http://schemas.microsoft.com/office/word/2010/wordprocessingInk',
            "xmlns:wne" => 'http://schemas.microsoft.com/office/word/2006/wordml',
            "xmlns:wps" => 'http://schemas.microsoft.com/office/word/2010/wordprocessingShape',
            "xmlns:w" => "http://schemas.openxmlformats.org/wordprocessingml/2006/main",
            "xmlns:mc" => "http://schemas.openxmlformats.org/markup-compatibility/2006",
            "mc:Ignorable" => "w14 wp14" }
        end

      end
    end
  end
end
