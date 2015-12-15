module OpenXml
  module DrawingML
    module Elements
      class HeadEnd < OpenXml::Docx::Elements::Element
        namespace :a

        attribute :length, expects: :valid_end_size, displays_as: :len
        attribute :type, expects: :valid_end_type
        attribute :width, expects: :valid_end_size, displays_as: :w

      private

        def valid_end_size(value)
          ok_values = %i(lg med sm)
          message = "Invalid #{name} (#{value}). Valid values are: #{ok_values.join(", ")}."
          raise ArgumentError, message unless ok_values.include? value
        end

        def valid_end_type(value)
          ok_values = %i(arrow diamond none oval stealth triangle)
          message = "Invalid end type (#{value}). Valid values are: #{ok_values.join(", ")}."
          raise ArgumentError, message unless ok_values.include? value
        end

      end
    end
  end
end
