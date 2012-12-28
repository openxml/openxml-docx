module Rocx
  class XmlRenderer
    
    def initialize(namespace)
      @namespace = namespace
    end
    
    def render_tree(element)
      element.children.each { |child| element.body << child.to_xml(@namespace) }
    end
    
  end
end