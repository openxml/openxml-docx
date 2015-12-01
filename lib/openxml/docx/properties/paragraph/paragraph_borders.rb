module OpenXml
  module Docx
    module Properties
      class ParagraphBorders < ComplexProperty
        attr_reader :left, :right, :top, :bottom, :between, :bar

        def initialize
          @left = new_border :left
          @right = new_border :right
          @top = new_border :top
          @bottom = new_border :bottom
          @between = new_border :between
          @bar = new_border :bar
        end

        tag :pBdr
        name "borders"

        def render?
          renderable_borders.any?
        end

        def to_xml(xml)
          return unless render?
          xml["w"].public_send(tag) { render_borders_xml(xml) }
        end

      private

        def render_borders_xml(xml)
          renderable_borders.each { |border| border.to_xml(xml) }
        end

        def renderable_borders
          [@left, @right, @top, @bottom, @between, @bar].select(&:render?)
        end

        def new_border(direction)
          OpenXml::Docx::Properties::Border.new direction
        end

      end
    end
  end
end
