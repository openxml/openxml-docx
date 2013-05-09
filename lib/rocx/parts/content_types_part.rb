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
      new_content_type :default, "xml", "application/xml"
      new_content_type :default, "rels", "application/vnd.openxmlformats-package.relationships+xml"
      new_content_type :default, "jpeg", "image/jpeg"
      new_content_type :override, "/word/document.xml", "application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"
      new_content_type :override, "/word/numbering.xml", "application/vnd.openxmlformats-officedocument.wordprocessingml.numbering+xml"
      new_content_type :override, "/word/styles.xml", "application/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml"
      new_content_type :override, "/word/stylesWithEffects.xml", "application/vnd.ms-word.stylesWithEffects+xml"
      new_content_type :override, "/word/settings.xml", "application/vnd.openxmlformats-officedocument.wordprocessingml.settings+xml"
      new_content_type :override, "/word/webSettings.xml", "application/vnd.openxmlformats-officedocument.wordprocessingml.webSettings+xml"
      new_content_type :override, "/word/fontTable.xml", "application/vnd.openxmlformats-officedocument.wordprocessingml.fontTable+xml"
      new_content_type :override, "/word/theme/theme1.xml", "application/vnd.openxmlformats-officedocument.theme+xml"
      new_content_type :override, "/docProps/core.xml", "application/vnd.openxmlformats-package.core-properties+xml"
      new_content_type :override, "/docProps/app.xml", "application/vnd.openxmlformats-officedocument.extended-properties+xml"
    end
    
    def to_s
      @document.to_s
    end
    
  private
    
    def new_content_type(type, name, content_type)
      name_attr = type == :default ? "Extension" : "PartName"
      node = XML::Node.new(type.to_s.capitalize)
      XML::Attr.new(node, name_attr, name)
      XML::Attr.new(node, "ContentType", content_type)
      @types << node
    end
    
  end
end