require 'libxml'

module Rocx
  class ContentTypesPart
    include LibXML
    
    attr_reader :path
    
    def initialize
      @path = '[Content_Types].xml'
      @document = XML::Document.new
      @document.root = XML::Node.new('Types')
      @types = @document.root
      XML::Namespace.new(@types, nil, "http://schemas.openxmlformats.org/package/2006/content-types")
    end
    
    def to_xml
      @types << default("xml", "application/xml")
      @types << default("rels", "application/vnd.openxmlformats-package.relationships+xml")
      @types << default("jpeg", "image/jpeg")
      @types << override("/word/document.xml", "application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml")
      @types << override("/word/styles.xml", "application/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml")
      @types << override("/word/stylesWithEffects.xml", "application/vnd.ms-word.stylesWithEffects+xml")
      @types << override("/word/settings.xml", "application/vnd.openxmlformats-officedocument.wordprocessingml.settings+xml")
      @types << override("/word/webSettings.xml", "application/vnd.openxmlformats-officedocument.wordprocessingml.webSettings+xml")
      @types << override("/word/fontTable.xml", "application/vnd.openxmlformats-officedocument.wordprocessingml.fontTable+xml")
      @types << override("/word/theme/theme1.xml", "application/vnd.openxmlformats-officedocument.theme+xml")
      @types << override("/docProps/core.xml", "application/vnd.openxmlformats-package.core-properties+xml")
      @types << override("/docProps/app.xml", "application/vnd.openxmlformats-officedocument.extended-properties+xml")
    end
    
    def default(extension, content_type)
      node = XML::Node.new("Default")
      XML::Attr.new(node, "Extension", extension)
      XML::Attr.new(node, "ContentType", content_type)
      node
    end
    
    def override(part_name, content_type)
      node = XML::Node.new("Override")
      XML::Attr.new(node, "PartName", part_name)
      XML::Attr.new(node, "ContentType", content_type)
      node
    end
    
    def to_s
      @document.to_s
    end
    
  end
end