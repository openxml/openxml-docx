module OpenXml
  module Docx
    module Properties
    end
  end
end

require "openxml/docx/properties/base_property"
require "openxml/docx/properties/complex/complex_property"
require "openxml/docx/properties/value_property"
require "openxml/docx/properties/boolean_property"
require "openxml/docx/properties/integer_property"
require "openxml/docx/properties/positive_integer_property"
require "openxml/docx/properties/string_property"
require "openxml/docx/properties/on_off_property"
require "openxml/docx/properties/toggle_property"
require "openxml/docx/properties/string_property"
require "openxml/docx/properties/width_property"
require "openxml/docx/properties/container_property"
require "openxml/docx/properties/style/style"
Dir.glob("#{File.join(File.dirname(__FILE__), "properties/**", "*.rb")}").each do |file|
  require file
end
