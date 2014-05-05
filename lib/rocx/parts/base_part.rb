require 'nokogiri'

module Rocx
  module Parts
    class BasePart
      include ::Nokogiri

      def build_xml
        XML::Builder.new(encoding: "utf-8") { |xml| yield xml }.to_xml
      end

    protected

      def strip_whitespace(xml)
        xml.lines.map(&:strip).join
      end

    end
  end
end
