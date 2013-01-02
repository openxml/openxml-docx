require 'libxml'

module Rocx
  class WebSettingsPart
    include LibXML
    
    attr_reader :path
    
    def initialize
      @path = 'word/webSettings.xml'
      @document = XML::Document.new
      @document.root = XML::Node.new('webSettings')
      @web_settings = @document.root
      @mc_namespace = XML::Namespace.new(@web_settings, 'mc', "http://schemas.openxmlformats.org/markup-compatibility/2006")
      XML::Namespace.new(@web_settings, 'r', "http://schemas.openxmlformats.org/officeDocument/2006/relationships")
      @w_namespace = XML::Namespace.new(@web_settings, 'w', "http://schemas.openxmlformats.org/wordprocessingml/2006/main")
      @web_settings.namespaces.namespace = @w_namespace
      XML::Namespace.new(@web_settings, 'w14', "http://schemas.microsoft.com/office/word/2010/wordml")
      ignorable = XML::Attr.new(@web_settings, 'Ignorable', 'w14')
      ignorable.namespaces.namespace = @mc_namespace
    end
    
    def to_xml
      @web_settings << XML::Node.new('allowPNG', nil, @w_namespace)
      @web_settings << XML::Node.new('doNotSaveAsSingleFile', nil, @w_namespace)
    end
    
    def to_s
      @document.to_s
    end
    
  end
end