module Rocx
  module Elements
    class Paragraph < BaseContainer
      tag_name :p
      namespace :w
      properties_tag :pPr
      property :alignment
      property :indentation
      property :bidi
      property :contextual_spacing

    end
  end
end
