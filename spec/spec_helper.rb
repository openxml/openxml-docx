require "simplecov"
SimpleCov.start

require "rubygems"
require "pry"
require "rocx"
require "timecop"

def part_xml(part)
  File.read(File.join(File.dirname(__FILE__), "data", "parts", "#{part}_part.xml"))
end

def element_xml(element)
  File.read(File.join(File.dirname(__FILE__), "data", "elements", "#{element}.xml"))
end
