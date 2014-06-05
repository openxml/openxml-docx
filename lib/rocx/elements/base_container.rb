module Rocx
  module Elements
    class BaseContainer < BaseElement
      attr_reader :children

      class << self
        def properties_tag(*args)
          @properties_tag = args.first if args.any?
          @properties_tag
        end

        def value_property(name)
          attr_reader name

          class_eval <<-CODE, __FILE__, __LINE__ + 1
          def #{name}=(value)
            class_name = "#{name}".split.map(&:capitalize).join
            prop_class = Rocx::Properties.const_get class_name
            instance_variable_set "@#{name}", prop_class.new(value)
          end
          CODE

          properties << name
        end

        def property(name)
          class_eval <<-CODE, __FILE__, __LINE__ + 1
          def #{name}
            class_name = "#{name}".split("_").map(&:capitalize).join
            prop_class = Rocx::Properties.const_get class_name

            if instance_variable_get("@#{name}").nil?
              instance_variable_set "@#{name}", prop_class.new
            end

            instance_variable_get "@#{name}"
          end
          CODE

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
          property_xml(xml)
          children.each { |child| child.to_xml(xml) }
        }
      end

    protected

      def property_xml(xml)
        props = properties.map(&method(:send)).compact
        return if props.none?(&:render?)
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
