require "rocx"
require "test/unit"
require "shoulda-context"
require "pry"
require "timecop"
require "turn"
require "simplecov"
SimpleCov.start

def part_xml(part)
  File.read(File.join(File.dirname(__FILE__), "data", "parts", "#{part}_part.xml"))
end

def assert_is_a(klass, instance)
  assert instance.is_a?(klass), "Expected #{instance} to be a #{klass}"
end
