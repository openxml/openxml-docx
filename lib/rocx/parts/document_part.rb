require 'libxml'
require 'rocx/elements/heading'
require 'rocx/elements/page_break'
require 'rocx/elements/paragraph'
require 'rocx/elements/table'
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
      @namespace = XML::Namespace.new(@document.root, 'w', "http://schemas.openxmlformats.org/wordprocessingml/2006/main")
      @body = XML::Node.new('body', nil, @namespace)
      @document.root << @body
      
      @children = []
      
      instance_eval &block if block_given?
    end
    
    def to_xml
      xr = XmlRenderer.new(namespace)
      xr.render_tree(self)
    end
    
    def bullet(text)
      paragraph(text, style: 'ListBullet')
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
