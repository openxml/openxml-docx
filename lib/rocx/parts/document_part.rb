require 'libxml'
require 'rocx/elements'
require 'xml_renderer'

module Rocx
  class DocumentPart
    include XmlElements
    include LibXML
    
    attr_reader :body,
                :children,
                :document,
                :media,
                :namespace,
                :path,
                :relationships
    
    WORTHLESS_NAMESPACES = {
      'wpc' => 'http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas',
      'mo' => 'http://schemas.microsoft.com/office/mac/office/2008/main',
      'mv' => 'urn:schemas-microsoft-com:mac:vml',
      'o' => 'urn:schemas-microsoft-com:office:office',
      'r' => 'http://schemas.openxmlformats.org/officeDocument/2006/relationships',
      'm' => 'http://schemas.openxmlformats.org/officeDocument/2006/math',
      'v' => 'urn:schemas-microsoft-com:vml',
      'wp14' => 'http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing',
      'wp' => 'http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing',
      'w10' => 'urn:schemas-microsoft-com:office:word',
      'w14' => 'http://schemas.microsoft.com/office/word/2010/wordml',
      'wpg' => 'http://schemas.microsoft.com/office/word/2010/wordprocessingGroup',
      'wpi' => 'http://schemas.microsoft.com/office/word/2010/wordprocessingInk',
      'wne' => 'http://schemas.microsoft.com/office/word/2006/wordml',
      'wps' => 'http://schemas.microsoft.com/office/word/2010/wordprocessingShape'
    }
    
    def initialize(relationships, &block)
      @path = 'word/document.xml'
      @relationships = relationships
      @document = XML::Document.new()
      @document.root = XML::Node.new('document')
      @media = []
      WORTHLESS_NAMESPACES.each { |k, v| XML::Namespace.new(@document.root, k, v) }
      
      @w_namespace = XML::Namespace.new(@document.root, 'w', "http://schemas.openxmlformats.org/wordprocessingml/2006/main")
      @document.root.namespaces.namespace = @w_namespace
      
      @mc_namespace = XML::Namespace.new(@document.root, "mc", "http://schemas.openxmlformats.org/markup-compatibility/2006")
      ignorable = XML::Attr.new(@document.root, "Ignorable", "w14 wp14")
      ignorable.namespaces.namespace = @mc_namespace
      
      @body = XML::Node.new('body', nil, @w_namespace)
      @document.root << @body
      
      @children = []
      
      instance_eval &block if block_given?
    end
    
    def to_xml
      xr = XmlRenderer.new(@w_namespace)
      xr.render_tree(self)
    end
    
    def image(source, options={})
      source = File.expand_path(source)
      raise ArgumentError.new("The file you supplied doesn't exist.") unless File.file?(source)
      new_image = Image.new(source, @relationships, options)
      @children << new_image
      @relationships = new_image.relationships
      @media << source
    end
    
    def respond_to_missing?(method_name, *args)
      element_name = method_name.to_s.split('_').map(&:capitalize).join
      return true if Rocx::XmlElements.const_get(element_name)
      super(method_name, *args)
    end
    
    def method_missing(method_name, *args, &block)
      element_name = method_name.to_s.split('_').map(&:capitalize).join
      element = Rocx::XmlElements.const_get(element_name)
      if element
        @children << element.new(*args)
      else
        super
      end
    end
    
    def to_s
      @document.to_s
    end
    
  end
end
