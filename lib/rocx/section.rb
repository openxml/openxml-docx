module Rocx
  class Section
    include PropertyBuilder

    properties_tag :sectPr

    value_property :bidi
    value_property :form_protection
    value_property :rtl_gutter

  private

    def namespace
      :w
    end

  end
end
