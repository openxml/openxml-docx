module Rocx
  class Section
    include PropertyBuilder

    properties_tag :sectPr

    value_property :bidi

  private

    def namespace
      :w
    end

  end
end
