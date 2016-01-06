module OpenXml
  module Docx
    module Properties
      class TransparentContainerProperty < ContainerProperty

        def to_xml(xml)
          return unless render?
          each { |child| child.to_xml(xml) }
        end

      end
    end
  end
end
