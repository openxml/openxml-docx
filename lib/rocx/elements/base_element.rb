module Rocx
  module Elements
    class BaseElement
      class << self

        def tag_name(*args)
          @tag_name = args.first if args.any?
          @tag_name
        end

        def namespace(*args)
          @namespace = args.first if args.any?
          @namespace
        end

        def attribute(name, limit_to: nil, xml_name: nil, regex: nil)
          attr_reader name

          if limit_to
            define_method "valid_#{name}" do
              limit_to
            end

            define_method "valid_#{name}?" do |value|
              send("valid_#{name}").member? value
            end

            define_method "#{name}=" do |value|
              valid_values = send("valid_#{name}").join(", ")
              raise ArgumentError, "Invalid #{name}; must be one of #{valid_values}" unless send("valid_#{name}?", value)
              instance_variable_set("@#{name}", value)
            end
          elsif regex
            define_method "valid_#{name}?" do |value|
              !!(regex =~ value)
            end

            define_method "#{name}=" do |value|
              raise ArgumentError, "Invalid #{name}; must match #{regex.inspect}" unless send("valid_#{name}?", value)
              instance_variable_set("@#{name}", value)
            end
          else
            attr_writer name
          end

          attributes[name] = xml_name || name
        end

        def attributes
          @attributes ||= {}
        end
      end

      def initialize(**args)
        args.each do |property, value|
          self.send("#{property}=", value)
        end
      end

      def to_xml(xml)
        if namespace
          xml[namespace].public_send tag_name, xml_attributes
        else
          xml.public_send tag_name, xml_attributes
        end
      end

    protected

      def xml_attributes
        attributes.each_with_object({}) do |(attribute, name), props|
          value = send(attribute)
          props[name] = value unless value.nil?
        end
      end

      def attributes
        self.class.attributes
      end

      def tag_name
        self.class.tag_name
      end

      def namespace
        self.class.namespace
      end

    end
  end
end
