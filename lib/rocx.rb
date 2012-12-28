require 'libxml'
require 'rocx/elements/heading'
require 'rocx/elements/page_break'
require 'rocx/elements/paragraph'
require 'xml_renderer'

module Rocx
  class Document
    include XmlElements
    include LibXML
    
    attr_accessor :document, :namespace, :children, :body
    
    def initialize(&block)
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
    
    def heading(text, level)
      @children << Heading.new(text, level)
    end
    
    def page_break(options={})
      @children << PageBreak.new(options)
    end
    
    def paragraph(text, options={})
      @children << Paragraph.new(text, options)
    end
    
    def to_s
      @document.to_s
    end
    
  end
end