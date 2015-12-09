module OpenXml
  module Docx
    module Properties
      class HeaderReference < ComplexProperty
        namespace :w

        attribute :id, expects: :string, namespace: :r
        attribute :type, expects: :valid_header_type, namespace: :w

      private

        def valid_header_type(value)
          ok_values = %i(default even first)
          message = "Invalid header type (#{value}). Allowed types are: #{ok_values.join(", ")}."
          raise ArgumentError, message unless ok_values.include? value
        end

      end
    end
  end
end
