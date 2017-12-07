module OpenXml
  module Docx
    module Elements
      class Number < OpenXml::Docx::Element
        include HasChildren, HasProperties
        tag :num

        def initialize(id)
          super()
          self.id = id
        end

        with_namespace :w do
          attribute :id, expects: :integer, displays_as: :numId, required: true
        end

        value_property :abstract_number_id
        value_property :lvl_override, as: :level_override

        def property_xml(xml)
          props = properties.keys.map(&method(:send)).compact
          return if props.none?(&:render?)

          props.each { |prop| prop.to_xml(xml) }
        end
      end
    end
  end
end
