module Rocx
  module Elements
    class Text < Element
      attr_reader :text

      tag_name :t
      namespace :w
      attribute :space, xml_name: "xml:space", limit_to: [nil, :preserve]

      def initialize(text, **args)
        @text = text
        super args
      end

      def to_xml(xml)
        xml[namespace].public_send tag_name, text, xml_attributes
      end

    end
  end
end
