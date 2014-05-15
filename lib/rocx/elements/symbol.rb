module Rocx
  module Elements
    class Symbol < BaseElement
      tag_name :sym
      namespace :w
      attribute :font, xml_name: "w:font"
      attribute :char, xml_name: "w:char", regex: /[0-9a-f]{4}/
    end
  end
end
