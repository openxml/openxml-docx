module OpenXml
  module Docx
    module Parts
      class Settings < OpenXml::Part
        include RootNamespaces

        use_namespace :w

        attr_reader :settings

        def initialize
          @settings = []
        end

        def <<(child)
          settings << child
        end

        def to_xml
          build_standalone_xml do |xml|
            xml.settings(root_namespaces) {
              xml.parent.namespace = :w
              settings.each { |setting| setting.to_xml(xml) }
            }
          end
        end

      end
    end
  end
end
