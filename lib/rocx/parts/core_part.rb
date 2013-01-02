require 'libxml'

module Rocx
  class CorePart
    include LibXML
    
    attr_reader :path
    
    def initialize(options={})
      @path = 'docProps/core.xml'
      @document = XML::Document.new
      @document.root = XML::Node.new('coreProperties')
      @core_props = @document.root
      
      @cp_namespace = XML::Namespace.new(@core_props, 'cp', "http://schemas.openxmlformats.org/package/2006/metadata/core-properties")
      @dc_namespace = XML::Namespace.new(@core_props, 'dc', "http://purl.org/dc/elements/1.1/")
      @dcterms_namespace = XML::Namespace.new(@core_props, 'dcterms', "http://purl.org/dc/terms/")
      @dcmitype_namespace = XML::Namespace.new(@core_props, 'dcmitype', "http://purl.org/dc/dcmitype/")
      @xsi_namespace = XML::Namespace.new(@core_props, 'xsi', "http://www.w3.org/2001/XMLSchema-instance")
      
      @title = options[:title]
      @subject = options[:subject]
      @creator = options[:creator]
      @keywords = options[:keywords]
      @revision = options[:revision] || 1
      @category = options[:category]
      @description = options[:description]
      @last_modified_by = options[:last_modified_by]
    end
      
    def to_xml
      @core_props << XML::Node.new('title', @title, @dc_namespace)
      @core_props << XML::Node.new('subject', @subject, @dc_namespace)
      @core_props << XML::Node.new('creator', @creator, @dc_namespace)
      @core_props << XML::Node.new('keywords', @keywords, @cp_namespace)
      
      @last_modified_by ||= @creator
      @core_props << XML::Node.new('lastModifiedBy', @last_modified_by, @cp_namespace)
      
      @core_props << XML::Node.new('revision', @revision.to_s, @cp_namespace)
      @core_props << XML::Node.new('category', @category, @cp_namespace)
      @core_props << XML::Node.new('description', @description, @dc_namespace)
      current_time = Time.new.strftime('%Y-%m-%dT%H:%M:%SZ')
      
      created = XML::Node.new('created', current_time, @dcterms_namespace)
      created_type = XML::Attr.new(created, 'type', 'dcterms:W3CDTF')
      created_type.namespaces.namespace = @xsi_namespace
      @core_props << created
      
      modified = XML::Node.new('modified', current_time, @dcterms_namespace)
      modified_type = XML::Attr.new(modified, 'type', 'dcterms:W3CDTF')
      modified_type.namespaces.namespace = @xsi_namespace
      @core_props << modified
    end
    
    def to_s
      @document.to_s
    end
    
  end
end