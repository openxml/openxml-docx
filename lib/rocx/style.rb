module Rocx
  class Style
    attr_reader :name, :type, :run, :paragraph

    def initialize(name, type, run={}, paragraph={})
      @name = name
      @type = type
      @run = run
      @paragraph = paragraph
    end

    def build_xml(xml)
      xml["w"].style("w:styleId" => name, "w:type" => type) {
        xml["w"].name("w:val" => name)
        paragraph_as_xml(xml)
        run_as_xml(xml)
      }
    end

  private

    def paragraph_as_xml(xml)
      xml["w"].pPr { xml_properties(xml, paragraph) }
    end

    def run_as_xml(xml)
      xml["w"].rPr { xml_properties(xml, run) }
    end

    def xml_properties(xml, properties)
      properties.each do |property, options|
        namespace, tag = property.split(":")
        xml[namespace].send(tag, options)
      end
    end

  end
end
