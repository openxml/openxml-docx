require "openxml/docx/chainable_nested_context"

module OpenXml
  module Docx
    module PropertyBuilder

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def properties_tag(*args)
          @properties_tag = args.first if args.any?
          @properties_tag
        end

        def value_property(name, as: nil)
          properties[name] = (as || name).to_s

          class_eval <<-CODE, __FILE__, __LINE__ + 1
          def #{name}=(value)
            property_key = "#{name}".to_sym
            class_name = properties[property_key].split("_").map(&:capitalize).join
            prop_class = OpenXml::Docx::Properties.const_get class_name
            instance_variable_set "@#{name}", prop_class.new(value)
          end

          def #{name}(*args)
            return instance_variable_get "@#{name}" if args.empty?
            public_send :"#{name}=", args.first
            self
          end
          CODE
        end

        def property(name, as: nil)
          properties[name] = (as || name).to_s

          class_eval <<-CODE, __FILE__, __LINE__ + 1
          def #{name}(*args)
            property_key = "#{name}".to_sym
            class_name = properties[property_key].split("_").map(&:capitalize).join
            prop_class = OpenXml::Docx::Properties.const_get class_name

            if instance_variable_get("@#{name}").nil?
              instance_variable_set "@#{name}", prop_class.new(*args)
            end

            prop_instance = instance_variable_get "@#{name}"

            if block_given?
              block = Proc.new
              if block.arity == 0
                prop_instance.instance_eval(&block)
              else
                yield self
              end
              return self
            end

            prop_instance.extend OpenXml::Docx::ChainableNestedContext
            prop_instance.instance_variable_set "@self_was", self
            prop_instance
          end
          CODE
        end

        def properties
          @properties ||= {}
        end
      end

      def property_xml(xml)
        props = properties.keys.map(&method(:send)).compact
        return if props.none?(&:render?)

        xml[namespace].public_send(properties_tag) {
          props.each { |prop| prop.to_xml(xml) }
        }
      end

    private

      def properties
        self.class.properties
      end

      def properties_tag
        self.class.properties_tag
      end
    end
  end
end
