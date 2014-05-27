module Rocx
  module Properties
  end
end

require "rocx/properties/base_property"
require "rocx/properties/boolean_property"
require "rocx/properties/toggle_property"
Dir.glob("#{File.join(File.dirname(__FILE__), "properties", "*.rb")}").each do |file|
  require file
end
