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

        def to_xml
          build_standalone_xml do |xml|
            xml.settings(root_namespaces) {
              xml.parent.namespace = :w
            }
          end
        end

      end
    end
  end
end
