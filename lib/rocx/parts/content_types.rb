module Rocx
  module Parts
    class ContentTypes < BasePart
      attr_reader :defaults, :overrides

      def initialize
        @defaults, @overrides = [], []
        install_preset_defaults
        install_preset_overrides
      end

      def install_preset_defaults
        default "xml", "application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"
        default "rels", "application/vnd.openxmlformats-package.relationships+xml"
        default "png", "image/png"
      end

      def install_preset_overrides
        override "/word/styles.xml", "application/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml"
        override "/word/settings.xml", "application/vnd.openxmlformats-officedocument.wordprocessingml.settings+xml"
      end

      def default(extension, content_type)
        defaults << {"Extension" => extension, "ContentType" => content_type}
      end

      def override(part_name, content_type)
        overrides << {"PartName" => part_name, "ContentType" => content_type}
      end

      def to_xml
        build_xml do |xml|
          xml.Types(xmlns: "http://schemas.openxmlformats.org/package/2006/content-types") {
            defaults.each { |default| xml.Default(default) }
            overrides.each { |override| xml.Override(override) }
          }
        end
      end

    end
  end
end
