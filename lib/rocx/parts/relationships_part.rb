require 'libxml'

module Rocx
  class RelationshipsPart
    include LibXML
    
    attr_reader :path
    
    def initialize(relationships)
      @path = 'word/_rels/document.xml.rels'
      @relationships = relationships
      @document = XML::Document.new
      @document.root = XML::Node.new('Relationships')
      @root_node = @document.root
      XML::Namespace.new(@root_node, nil, "http://schemas.openxmlformats.org/package/2006/relationships")
    end
    
    def to_xml
      @relationships.each_with_index do |relationship, n|
        type, target = relationship
        relationship = XML::Node.new('Relationship')
        XML::Attr.new(relationship, "Id", "rId#{n + 1}")
        XML::Attr.new(relationship, "Type", type)
        XML::Attr.new(relationship, "Target", target)
        @root_node << relationship
      end
    end
    
    def to_s
      @document.to_s
    end
    
  end
end