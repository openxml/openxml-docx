module Rocx
  class Section
    include PropertyBuilder

    properties_tag :sectPr

  private

    def namespace
      :w
    end

  end
end
