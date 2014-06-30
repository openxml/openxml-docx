module Rocx
  module Properties
  end
end

require "rocx/properties/base_property"
require "rocx/properties/complex_property"
require "rocx/properties/value_property"
require "rocx/properties/boolean_property"
require "rocx/properties/integer_property"
require "rocx/properties/positive_integer_property"
require "rocx/properties/on_off_property"
require "rocx/properties/toggle_property"
require "rocx/properties/container_property"
require "rocx/properties/style"
Dir.glob("#{File.join(File.dirname(__FILE__), "properties", "*.rb")}").each do |file|
  require file
end
