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
      build_namespaces
      parse_options(options)
      @current_time = Time.new.strftime('%Y-%m-%dT%H:%M:%SZ')
    end
      
    def to_xml
      build_property 'title',          :dc
      build_property 'subject',        :dc
      build_property 'creator',        :dc
      build_property 'keywords',       :cp
      build_property 'lastModifiedBy', :cp
      build_property 'revision',       :cp
      build_property 'category',       :cp
      build_property 'description',    :dc
      
      build_timestamp_nodes
    end
    
    def to_s
      @document.to_s
    end
    
  private
    
    def build_property(name, namespace)
      @core_props << XML::Node.new(name, instance_variable_get("@#{name}"), instance_variable_get("@#{namespace}_namespace"))
    end
    
    def build_timestamp_nodes
      %w(created modified).each do |timestamp_name|
        node = XML::Node.new(timestamp_name, @current_time, @dcterms_namespace)
        type = XML::Attr.new(node, 'type', 'dcterms:W3CDTF')
        type.namespaces.namespace = @xsi_namespace
        @core_props << node
      end
    end
    
    def build_namespaces
      @cp_namespace = XML::Namespace.new(@core_props, 'cp', "http://schemas.openxmlformats.org/package/2006/metadata/core-properties")
      @dc_namespace = XML::Namespace.new(@core_props, 'dc', "http://purl.org/dc/elements/1.1/")
      @dcterms_namespace = XML::Namespace.new(@core_props, 'dcterms', "http://purl.org/dc/terms/")
      @dcmitype_namespace = XML::Namespace.new(@core_props, 'dcmitype', "http://purl.org/dc/dcmitype/")
      @xsi_namespace = XML::Namespace.new(@core_props, 'xsi', "http://www.w3.org/2001/XMLSchema-instance")
    end
    
    def parse_options(options)
      @title = options[:title]
      @subject = options[:subject]
      @creator = options[:creator]
      @keywords = options[:keywords]
      @revision = (options[:revision] || 1).to_s
      @category = options[:category]
      @description = options[:description]
      @last_modified_by = options[:last_modified_by] || @creator
    end
    
  end
end