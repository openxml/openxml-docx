require 'nokogiri'

module Rocx
  module Parts
    class BasePart
      include ::Nokogiri

      def build_xml
        XML::Builder.new(encoding: "utf-8") { |xml| yield xml }.to_xml
      end

      def build_standalone_xml
        xml = Nokogiri::XML("<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\"?>")
        XML::Builder.with(xml) { |xml| yield xml }.to_xml
      end

      def read
        strip_whitespace to_xml
      end

      def to_xml
        raise NotImplementedError
      end

    protected

      def strip_whitespace(xml)
        xml.lines.map(&:strip).join
      end

    end
  end
end
