require 'libxml'
require 'rocx/elements/heading'
require 'rocx/elements/page_break'
require 'rocx/elements/paragraph'
require 'rocx/elements/table'
require 'rocx/elements/bullet'
require 'xml_renderer'

module Rocx
  class DocumentPart
    include XmlElements
    include LibXML
    
    attr_reader :document, :namespace, :children, :body, :path
    
    def initialize(&block)
      @path = 'word/document.xml'
      @document = XML::Document.new()
      @document.root = XML::Node.new('document')
      @w_namespace = XML::Namespace.new(@document.root, 'w', "http://schemas.openxmlformats.org/wordprocessingml/2006/main")
      @document.root.namespaces.namespace = @w_namespace
      XML::Namespace.new(@document.root, "wpc", "http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas")
      XML::Namespace.new(@document.root, "mo", "http://schemas.microsoft.com/office/mac/office/2008/main")
      @mc_namespace = XML::Namespace.new(@document.root, "mc", "http://schemas.openxmlformats.org/markup-compatibility/2006")
      XML::Namespace.new(@document.root, "mv", "urn:schemas-microsoft-com:mac:vml")
      XML::Namespace.new(@document.root, "o", "urn:schemas-microsoft-com:office:office")
      XML::Namespace.new(@document.root, "r", "http://schemas.openxmlformats.org/officeDocument/2006/relationships")
      XML::Namespace.new(@document.root, "m", "http://schemas.openxmlformats.org/officeDocument/2006/math")
      XML::Namespace.new(@document.root, "v", "urn:schemas-microsoft-com:vml")
      XML::Namespace.new(@document.root, "wp14", "http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing")
      XML::Namespace.new(@document.root, "wp", "http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing")
      XML::Namespace.new(@document.root, "w10", "urn:schemas-microsoft-com:office:word")
      XML::Namespace.new(@document.root, "w14", "http://schemas.microsoft.com/office/word/2010/wordml")
      XML::Namespace.new(@document.root, "wpg", "http://schemas.microsoft.com/office/word/2010/wordprocessingGroup")
      XML::Namespace.new(@document.root, "wpi", "http://schemas.microsoft.com/office/word/2010/wordprocessingInk")
      XML::Namespace.new(@document.root, "wne", "http://schemas.microsoft.com/office/word/2006/wordml")
      XML::Namespace.new(@document.root, "wps", "http://schemas.microsoft.com/office/word/2010/wordprocessingShape")
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
    
    def bullet(text)
      @children << Bullet.new(text)
    end
    
    def heading(text, level=1)
      @children << Heading.new(text, level)
    end
    
    def page_break(options={})
      @children << PageBreak.new(options)
    end
    
    def paragraph(text, options={})
      @children << Paragraph.new(text, options)
    end
    
    def table(contents, options={})
      @children << Table.new(contents, options)
    end
    
    def to_s
      @document.to_s
    end
    
    def export(file_name)
      # coreprops = coreproperties(title='Python docx demo',subject='A practical example of making docx from Python',creator='Mike MacCana',keywords=['python','Office Open XML','Word'])
      # appprops = appproperties()
      # contenttypes = contenttypes()
      # websettings = websettings()
      # wordrelationships = wordrelationships(relationships)
      # 
      # # Save our document
      # savedocx(document,coreprops,appprops,contenttypes,websettings,wordrelationrships,'Welcome to the Python docx module.docx')
    end
    
  end
end
