module OpenXml
  module Docx
    module Properties
      class PageBorders < ComplexProperty
        attr_reader :left, :right, :top, :bottom

        tag :pgBorders

        with_namespace :w do
          attribute :display, one_of: %i(allPages firstPage notFirstPage)
          attribute :offset_from, one_of: %i(page text)
          attribute :z_order, one_of: %i(front back)
        end

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

      end
    end
  end
end
