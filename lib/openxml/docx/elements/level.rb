module OpenXml
  module Docx
    module Elements
      class Level < OpenXml::Docx::Element
        include HasChildren, HasProperties
        tag :lvl

        with_namespace :w do
          attribute :level, expects: :integer, displays_as: :ilvl
          attribute :tplc
          attribute :tentative
        end

        value_property :start
        value_property :number_format
        # value_property :lvl_restart
        # value_property :p_style
        # value_property :is_lgl
        # value_property :suff
        value_property :level_text
        # value_property :lvl_pic_bullet_id
        value_property :alignment, as: :level_alignment
        # property :p
        # property :r

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
          @paragraph_style.property_xml(xml) unless @paragraph_style.nil?
          @character_style.property_xml(xml) unless @character_style.nil?
        end
      end
    end
  end
end
