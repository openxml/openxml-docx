module Rocx
  module Elements
    class Paragraph < BaseContainer
      tag_name :p
      namespace :w
      properties_tag :pPr
      property :alignment
      property :indentation

    end
  end
end
