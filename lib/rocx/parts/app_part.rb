require 'libxml'

module Rocx
  class AppPart
    include LibXML
    
    attr_reader :path
    
    def initialize
      @path = 'docProps/app.xml'
      @document = XML::Document.new
      @document.root = XML::Node.new('Properties')
      @properties = @document.root
      XML::Namespace.new(@properties, nil, "http://schemas.openxmlformats.org/officeDocument/2006/extended-properties")
      XML::Namespace.new(@properties, 'vt', "http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes")
    end
    
    def to_xml
      props = {
        'Template' => "Normal.dotm",
        'TotalTime' => "6",
        'Pages' => "1", # !todo: find actual pages
        'Words' => "0", # !todo: find actual words
        'Characters' => "475", # !todo find actual characters
        'Application' => "Microsoft Word 14.0.0",
        'DocSecurity' => "0",
        'Lines' => "1", # !todo: find actual lines
        'Paragraphs' => "8", # !todo: find paragraphs
        'ScaleCrop' => "false",
        'Company' => nil,
        'LinksUpToDate' => "false",
        'CharactersWithSpaces' => "99", # !todo: find actual characters with spaces
        'SharedDoc' => "false",
        'HyperlinksChanged' => "false",
        'AppVersion' => '14.0000'
      }
      props.each do |prop, prop_value|
        @properties << XML::Node.new(prop, prop_value)
      end
    end
    
    def to_s
      @document.to_s
    end
     
  end
end