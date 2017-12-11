module OpenXml
  module Docx
    module Elements
      class Level < OpenXml::Docx::Element
        include HasChildren, HasProperties
        tag :lvl

        with_namespace :w do
          attribute :level, expects: :integer, displays_as: :ilvl # required
          # tplc is an entirely opaque "Word template code" and is
          # "application-specific" according to the spec
          attribute :template_code, expects: :long_hex_number, displays_as: :tplc
          attribute :tentative, expects: :boolean
        end

        value_property :start
        value_property :number_format
        value_property :level_restart
        value_property :paragraph_style
        value_property :legal_numbering
        value_property :suffix
        value_property :level_text
        # TODO: Add pic_bullet support (this refers to an element that isn't
        # implemented in the Numbering part)
        # value_property :lvl_pic_bullet_id
        value_property :alignment, as: :level_alignment

        def paragraph_style
          @paragraph_style ||= Paragraph.new
        end

        def character_style
          @character_style ||= Run.new
        end

        def property_xml(xml)
          props = properties.keys.map(&method(:send)).compact
          return if props.none?(&:render?)

          props.each { |prop| prop.to_xml(xml) }
        end

        def to_xml(xml)
          xml["w"].public_send(tag, xml_attributes) {
            property_xml(xml)
            @paragraph_style.property_xml(xml) unless @paragraph_style.nil?
            @character_style.property_xml(xml) unless @character_style.nil?
          }
        end
      end
    end
  end
end
