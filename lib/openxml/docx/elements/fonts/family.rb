module OpenXml
  module Docx
    module Elements
      class Family < Element
        namespace :w

        with_namespace :w do
          attribute :value, expects: :valid_font_family, displays_as: :val
        end

      private

        def valid_font_family(value)
          ok_values = %i(auto decorative modern roman script swiss) # From the spec section 17.18.30
          message = "Invalid font family type (#{value}). Valid options are: #{ok_values.join(", ")}."
          raise ArgumentError, message unless ok_values.inculde? value
        end

      end
    end
  end
end
