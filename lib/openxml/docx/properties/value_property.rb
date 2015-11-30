module OpenXml
  module Docx
    module Properties
      class ValueProperty < BaseProperty
        attr_reader :value

        def initialize(value)
          @value = value
          raise ArgumentError, invalid_message unless valid?
        end

        def valid?
          ok_values.member? value
        end

        def invalid_message
          "Invalid value for #{name}; acceptable values are #{ok_values.join(", ")} (provided: #{value.inspect})"
        end

        def render?
          !value.nil?
        end

        def to_xml(xml)
          xml["w"].public_send(tag, "w:val" => value)
        end

      end
    end
  end
end
