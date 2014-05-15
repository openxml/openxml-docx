module Rocx
  module Elements
  end
end

require "rocx/elements/base_element"
require "rocx/elements/base_container"
require "rocx/elements/property"
Dir.glob("#{File.join(File.dirname(__FILE__), "elements", "*.rb")}").each do |file|
  require file
end
