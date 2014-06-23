module Rocx
  class Section
    include PropertyBuilder

    properties_tag :sectPr

    value_property :bidi
    value_property :form_protection
    value_property :rtl_gutter
    value_property :text_direction
    value_property :type, as: :section_type

  private

    def namespace
      :w
    end

  end
end
