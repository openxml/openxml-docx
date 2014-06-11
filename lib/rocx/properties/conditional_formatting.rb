module Rocx
  module Properties
    class ConditionalFormatting < BaseProperty
      tag :cnfStyle

      VALID_ARGUMENTS = %i(even_h
                           even_v
                           odd_h
                           odd_v
                           first_column
                           first_row
                           last_column
                           last_row
                           first_row_first_column
                           first_row_last_column
                           last_row_first_column
                           last_row_last_column)

      VALID_ARGUMENTS.each do |arg|
        attr_accessor arg
      end

      def initialize(**args)
        check_arguments(args)
        assign_arguments(args)
      end

      def to_xml(xml)
        xml["w"].public_send(tag, xml_properties)
      end

    private

      def check_arguments(args)

        args.keys.each do |key|
          raise ArgumentError, "Invalid argument for conditional formatting" unless VALID_ARGUMENTS.member?(key)
        end

        args.values.each do |value|
          raise ArgumentError, "Invalid value for conditional formatting" unless [true, false].member?(value)
        end
      end

      def assign_arguments(args)
        args.each do |key, val|
          send "#{key}=", val
        end
      end

      def xml_properties
        VALID_ARGUMENTS.each_with_object({}) do |arg, props|
          value = send(arg)
          props["w:#{arg}"] = value if value
        end
      end

    end
  end
end
