module Rocx
  module Elements
    class Ruby < Container
      value_property :alignment, as: :phonetic_guide_alignment
      value_property :base_font_size, as: :phonetic_guide_base_font_size
      value_property :font_size, as: :phonetic_guide_font_size
      value_property :font_size_raise, as: :phonetic_guide_font_size_raise
      value_property :language, as: :phonetic_guide_language
    end
  end
end
