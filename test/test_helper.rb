require "rocx"
require "open_xml_package"
require "test/unit"
require "rr"
require "shoulda-context"
require "pry"
require "timecop"
require "turn"
require "simplecov"
SimpleCov.start

def part_xml(part)
  File.read(File.join(File.dirname(__FILE__), "data", "parts", "#{part}_part.xml"))
end

def style_xml(part)
  File.read(File.join(File.dirname(__FILE__), "data", "styles", "#{part}_styles.xml"))
end

def element_xml(part)
  File.read(File.join(File.dirname(__FILE__), "data", "elements", "#{part}_element.xml"))
end

def build_xml
  Nokogiri::XML::Builder.new do |xml|
    xml.root("xmlns:w" => "http://wnamespace.org") {
      yield xml
    }
  end.to_xml
end

require "test_helper"

class PropertyTest < Test::Unit::TestCase
  include Rocx::Properties

private

  def xml(obj)
    doc = Nokogiri::XML::Builder.new do |xml|
      xml.root("xmlns:w" => "http://wnamespace.org") {
        obj.to_xml(xml)
      }
    end.to_xml
    doc_pattern =~ doc ? $1 : ""
  end

  def doc_pattern
    /<\?xml\sversion="1.0"\?>\n<root xmlns:w="http:\/\/wnamespace.org">\n\s+([^\s].+)\n<\/root>/m
  end

end
