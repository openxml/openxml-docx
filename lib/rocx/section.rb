module Rocx
  class Section
    include PropertyBuilder

    properties_tag :sectPr

    value_property :bidi
    value_property :form_protection
    value_property :rtl_gutter
    value_property :text_direction

  private

    def namespace
      :w
    end

  end
end
