module Rocx
  module Properties
    module AttributeBuilder

      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def attribute(name, expects: nil, displays_as: nil)
          attr_reader name

          define_method "#{name}=" do |value|
            send(expects, name, value)
            instance_variable_set "@#{name}", value
          end

          attributes[name] = displays_as || name
        end

        def attributes
          @attributes ||= {}
        end
      end

      def render?
        attributes.keys.map(&method(:send)).any?
      end

      def attributes
        self.class.attributes
      end

    private

      def xml_attributes
        attributes.each_with_object({}) do |(name, display), attrs|
          value = send(name)
          attrs["w:#{display}"] = value if value
        end
      end

      def true_or_false(name, value)
        message = "Invalid #{name}: frame must be true or false"
        raise ArgumentError, message unless [true, false].member? value
      end

      def hex_color(name, value)
        message = "Invalid #{name}: must be :auto or a hex color, e.g. 4F1B8C"
        raise ArgumentError, message unless value == :auto || value =~ /[0-9A-F]{6}/
      end

      def hex_digit(name, value)
        message = "Invalid #{name}: must be a two-digit hex number, e.g. BF"
        raise ArgumentError, message unless value =~ /[0-9A-F]{2}/
      end

      def positive_integer(name, value)
        message = "Invalid #{name}: must be a positive integer"
        raise ArgumentError, message unless value.is_a?(Integer) && value >= 0
      end

    end
  end
end
