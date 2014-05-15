module Rocx
  module Elements
    class Symbol < RunContent
      tag_name :sym
      attribute :font, xml_name: "w:font"
      attribute :char, xml_name: "w:char", regex: /[0-9a-f]{4}/
    end
  end
end
