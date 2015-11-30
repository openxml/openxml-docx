module OpenXml
  module Docx
    module Properties
      class PageBorders < ComplexProperty
        attr_reader :left, :right, :top, :bottom

        tag :pgBorders
        attribute :display, expects: :valid_display
        attribute :offset_from, expects: :valid_offset
        attribute :z_order, expects: :valid_z_order

        def initialize
          @left = new_border :left
          @right = new_border :right
          @top = new_border :top
          @bottom = new_border :bottom
        end

        def render?
          renderable_borders.any?
        end

        def to_xml(xml)
          return unless render?
          xml["w"].public_send(tag, xml_attributes) { render_borders_xml(xml) }
        end

        VALID_DISPLAYS = %i(allPages firstPage notFirstPage)
        VALID_OFFSETS = %i(page text)
        VALID_Z_ORDERS = %i(front back)

      private

        def render_borders_xml(xml)
          renderable_borders.each { |border| border.to_xml(xml) }
        end

        def renderable_borders
          [@left, @right, @top, @bottom].select(&:render?)
        end

        def new_border(direction)
          OpenXml::Docx::Properties::Border.new direction
        end

        def valid_display(value)
          valid_in? value, VALID_DISPLAYS
        end

        def valid_offset(value)
          valid_in? value, VALID_OFFSETS
        end

        def valid_z_order(value)
          valid_in? value, VALID_Z_ORDERS
        end

      end
    end
  end
end
