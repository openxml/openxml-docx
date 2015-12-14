module OpenXml
  module Docx
    module Properties
      class FooterReference < ComplexProperty
        namespace :w

        attribute :id, expects: :string, namespace: :r
        attribute :type, expects: :valid_footer_type, namespace: :w

      private

        def valid_footer_type(value)
          ok_values = %i(default even first)
          message = "Invalid footer type (#{value}). Allowed types are: #{ok_values.join(", ")}."
          raise ArgumentError, message unless ok_values.include? value
        end

      end
    end
  end
end
