module Rocx
  module Parts
    class ContentTypes < BasePart

      def to_xml
        build_xml do |xml|
          xml.Types(xmlns: "http://schemas.openxmlformats.org/package/2006/content-types") {
            defaults.each { |default| xml.Default(default) }
            overrides.each { |override| xml.Override(override) }
          }
        end
      end

    private

      def defaults
        [ {"Extension" => "xml", "ContentType" => "application/xml" },
          {"Extension" => "rels", "ContentType" => "application/vnd.openxmlformats-package.relationships+xml" },
          {"Extension" => "jpeg", "ContentType" => "image/jpeg" } ]
      end

      def overrides
        [ {"PartName" => "/word/document.xml", "ContentType" => "application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"},
          {"PartName" => "/word/numbering.xml", "ContentType" => "application/vnd.openxmlformats-officedocument.wordprocessingml.numbering+xml"},
          {"PartName" => "/word/styles.xml", "ContentType" => "application/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml"},
          {"PartName" => "/word/stylesWithEffects.xml", "ContentType" => "application/vnd.ms-word.stylesWithEffects+xml"},
          {"PartName" => "/word/settings.xml", "ContentType" => "application/vnd.openxmlformats-officedocument.wordprocessingml.settings+xml"},
          {"PartName" => "/word/webSettings.xml", "ContentType" => "application/vnd.openxmlformats-officedocument.wordprocessingml.webSettings+xml"},
          {"PartName" => "/word/fontTable.xml", "ContentType" => "application/vnd.openxmlformats-officedocument.wordprocessingml.fontTable+xml"},
          {"PartName" => "/word/theme/theme1.xml", "ContentType" => "application/vnd.openxmlformats-officedocument.theme+xml"},
          {"PartName" => "/docProps/core.xml", "ContentType" => "application/vnd.openxmlformats-package.core-properties+xml"},
          {"PartName" => "/docProps/app.xml", "ContentType" => "application/vnd.openxmlformats-officedocument.extended-properties+xml"} ]
      end

    end
  end
end



