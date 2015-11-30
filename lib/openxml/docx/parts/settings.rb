module OpenXml
  module Docx
    module Parts
      class Settings < OpenXml::Part
        attr_reader :settings

        def initialize
          @settings = []
        end

        def to_xml
          build_standalone_xml do |xml|
            xml.settings("xmlns:w" => "http://schemas.openxmlformats.org/wordprocessingml/2006/main") {
              xml.parent.namespace = xml.parent.namespace_definitions.find { |ns| ns.prefix == "w" }
            }
          end
        end

      end
    end
  end
end
