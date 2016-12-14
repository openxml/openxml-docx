module OpenXml
  module Docx
    module Properties
      class ToggleProperty < OnOffProperty
        # Toggle properties are no different in representation than on/off properties;
        # rather, the difference is in how they compose with one another (cf.
        # Section 17.7.3). It's helpful, then, to retain the concept, but entirely
        # unnecessary to duplicate implementation.
        # cf. Section A.6.9 of the spec, and Section A.7.9 of the transitional spec.
      end
    end
  end
end
