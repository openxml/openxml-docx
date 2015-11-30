module Rocx
  module Properties
    class ContainerProperty < BaseProperty
      include Enumerable
      include AttributeBuilder

      class << self
        def child_class(*args)
          if args.any?
            prop_name = args.first.to_s.split(/_/).map(&:capitalize).join # LazyCamelCase
            child_class_obj = Rocx::Properties.const_get prop_name
            @child_class = Rocx::Properties.const_get prop_name
          end

          @child_class
        end
      end

      def initialize
        @children = []
      end

      def <<(child)
        raise ArgumentError, invalid_child_message unless valid_child?(child)
        children << child
      end

      def each(*args, &block)
        children.each *args, &block
      end

      def render?
        !children.length.zero?
      end

      def to_xml(xml)
        return unless render?

        xml["w"].public_send(tag, xml_attributes) {
          each { |child| child.to_xml(xml) }
        }
      end

    private

      attr_reader :children

      def invalid_child_message
        class_name = self.class.to_s.split(/::/).last
        "#{class_name} must be instances of Rocx::Properties::#{child_class}"
      end

      def valid_child?(child)
        child.is_a?(child_class)
      end

      def child_class
        self.class.child_class
      end

    end
  end
end
