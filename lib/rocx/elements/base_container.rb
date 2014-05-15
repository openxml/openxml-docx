module Rocx
  module Elements
    class BaseContainer < BaseElement
      attr_reader :children

      class << self
        def properties_tag(*args)
          @properties_tag = args.first if args.any?
          @properties_tag
        end

        def property(name)
          attr_reader name

          define_method "#{name}=" do |value|
            prop_class = Rocx::Properties.const_get name.capitalize
            instance_variable_set "@#{name}", prop_class.new(value)
          end

          properties << name
        end

        def properties
          @properties ||= []
        end
      end

      def initialize(**args)
        @children = []
        super args
      end

      def <<(child)
        children << child
      end

      def to_xml(xml)
        (namespace ? xml[namespace] : xml).public_send(tag_name, xml_attributes) {
          children.each { |child| child.to_xml(xml) }
          property_xml(xml)
        }
      end

    protected

      def property_xml(xml)
        props = properties.map(&method(:send)).compact
        return if props.empty?
        xml[namespace].public_send(properties_tag) {
          props.each { |prop| prop.to_xml(xml) }
        }
      end

      def properties
        self.class.properties
      end

      def properties_tag
        self.class.properties_tag
      end

    end
  end
end
