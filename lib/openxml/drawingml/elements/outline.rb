module OpenXml
  module DrawingML
    module Elements
      class Outline < OpenXml::Docx::Elements::Container
        namespace :a
        tag :ln

        attribute :alignment, expects: :valid_stroke_alignment, displays_as: :algn
        attribute :cap, expects: :valid_cap_type
        attribute :compound_type, expects: :valid_compound_type, displays_as: :cmpd
        attribute :width, expects: :positive_integer, displays_as: :w

      private

        def valid_stroke_alignment(value)
          ok_values = %i(ctr in)
          message = "Invalid stroke alignment (#{value}). Valid values are: #{ok_values.join(", ")}."
          raise ArgumentError, message unless ok_values.include? value
        end

        def valid_cap_type(value)
          ok_values = %i(flat rnd sq)
          message = "Invalid line cap type (#{value}). Valid values are: #{ok_values.join(", ")}."
          raise ArgumentError, message unless ok_values.include? value
        end

        def valid_compound_type(value)
          ok_values = %i(dbl sng thickThin thinThick tri)
          message = "Invalid compound line type (#{value}). Valid values are: #{ok_values.join(", ")}."
          raise ArgumentError, message unless ok_values.include? value
        end

      end
    end
  end
end
