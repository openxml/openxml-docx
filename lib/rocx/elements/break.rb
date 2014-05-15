module Rocx
  module Elements
    class Break < RunContent
      tag_name :br
      attribute :break_type, xml_name: "w:type", limit_to: [nil, :column, :page, :textWrapping]
      attribute :clear, xml_name: "w:clear", limit_to: [nil, :all, :left, :none, :right]
    end
  end
end
