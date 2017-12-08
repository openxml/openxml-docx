module OpenXml
  module Docx
    module Elements
      class LevelOverride < OpenXml::Docx::Element
        include HasChildren, HasProperties
        tag :lvlOverride

        with_namespace :w do
          attribute :level, expects: :integer, displays_as: :ilvl # required
        end

        value_property :start_override

        def override
          @override ||= Level.new
        end

        def to_xml(xml)
          xml["w"].public_send(tag, xml_attributes) {
            start_override.to_xml(xml)
            @override.to_xml(xml) unless @override.nil?
          }
        end
      end
    end
  end
end
