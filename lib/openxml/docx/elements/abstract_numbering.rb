module OpenXml
  module Docx
    module Elements
      class AbstractNumbering < OpenXml::Docx::Element
        include HasChildren, HasProperties
        tag :abstractNum

        def initialize(id)
          super()
          self.id = id
        end
        # TODO: child levels is limited to a max of 9

        with_namespace :w do
          attribute :id, expects: :integer, displays_as: :abstractNumId#, required: true
        end

        # value_property :nsid - this is a UI property and likely not worth implementing
        value_property :multi_level_type
        # value_property :tmpl - this is a UI property and likely not worth implementing
        # value_property :name
        # value_property :style_link
        # value_property :num_style_link

        def property_xml(xml)
          props = properties.keys.map(&method(:send)).compact
          return if props.none?(&:render?)

          props.each { |prop| prop.to_xml(xml) }
        end
      end
    end
  end
end
