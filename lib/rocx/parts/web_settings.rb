module Rocx
  module Parts
    class WebSettings < BasePart

      def to_xml
        XML::Builder.new(encoding: "UTF-8") do |xml|
          xml.webSettings(root_namespaces) {
            xml.parent.namespace = xml.parent.namespace_definitions.find { |ns| ns.prefix == 'w' }
            xml['w'].allowPNG
            xml['w'].doNotSaveAsSingleFile
          }
        end.to_xml
      end

    private

      def root_namespaces
        { "xmlns:mc" => "http://schemas.openxmlformats.org/markup-compatibility/2006",
          "xmlns:r" => "http://schemas.openxmlformats.org/officeDocument/2006/relationships",
          "xmlns:w" => "http://schemas.openxmlformats.org/wordprocessingml/2006/main",
          "xmlns:w14" => "http://schemas.microsoft.com/office/word/2010/wordml",
          "mc:Ignorable" => "w14" }
      end

    end
  end
end
