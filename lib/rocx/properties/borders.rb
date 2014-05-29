module Rocx
  module Properties
    class Borders
      attr_reader :left, :right, :top, :bottom, :between, :bar

      def initialize
        @left = new_border :left
        @right = new_border :right
        @top = new_border :top
        @bottom = new_border :bottom
        @between = new_border :between
        @bar = new_border :bar
      end

      def tag
        :pBdr
      end

      def name
        "borders"
      end

      def to_xml(xml)
        return if no_borders_to_render?
        xml["w"].public_send(tag) { render_borders_xml(xml) }
      end

    private

      def render_borders_xml(xml)
        renderable_borders.each { |border| border.to_xml(xml) }
      end

      def no_borders_to_render?
        renderable_borders.length.zero?
      end

      def renderable_borders
        [@left, @right, @top, @bottom, @between, @bar].select(&:render?)
      end

      def new_border(direction)
        Rocx::Properties::Border.new direction
      end

    end
  end
end
