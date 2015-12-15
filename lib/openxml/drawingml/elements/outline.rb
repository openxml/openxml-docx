module OpenXml
  module DrawingML
    module Elements
      class Outline < OpenXml::Docx::Elements::Container
        namespace :a
        tag :ln

        attribute :alignment, one_of: %i(ctr in), displays_as: :algn
        attribute :cap, one_of: %i(flat rnd sq)
        attribute :compound_type, one_of: %i(dbl sng thickThin thinThick tri), displays_as: :cmpd
        attribute :width, expects: :positive_integer, displays_as: :w

      end
    end
  end
end
