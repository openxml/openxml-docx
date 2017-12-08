module OpenXml
  module Docx
    module Elements
      class AbstractNumber < OpenXml::Docx::Element
        include HasChildren, HasProperties
        tag :abstractNum

        def initialize(id)
          super()
          self.id = id
        end

        with_namespace :w do
          attribute :id, expects: :integer, displays_as: :abstractNumId, required: true
        end

        # value_property :nsid
        value_property :multi_level_type
        # value_property :tmpl
        # value_property :name
        # value_property :style_link
        # value_property :num_style_link
      end
    end
  end
end
