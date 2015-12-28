module OpenXml
  module Docx
    module Properties
      class ContainerProperty < BaseProperty
        include Enumerable
        include AttributeBuilder

        class << self
          def child_class(*args)
            @child_classes = args.map do |arg|
              prop_name = arg.to_s.split(/_/).map(&:capitalize).join # LazyCamelCase
              OpenXml::Docx::Properties.const_get prop_name
            end unless args.empty?

            @child_classes
          end
          alias :child_classes :child_class
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
          "#{class_name} must be instances of one of the following: #{child_classes}"
        end

        def valid_child?(child)
          child_classes.any? {|child_class| child.is_a?(child_class) }
        end

        def child_classes
          self.class.child_classes
        end

      end
    end
  end
end
