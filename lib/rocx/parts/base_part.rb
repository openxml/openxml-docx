require 'nokogiri'

module Rocx
  module Parts
    class BasePart
      include ::Nokogiri

      def build_xml
        XML::Builder.new(encoding: "UTF-8") { |xml| yield xml }.to_xml
      end

    end
  end
end
