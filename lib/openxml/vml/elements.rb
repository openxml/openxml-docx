module OpenXml
  module Vml
    module Elements
    end
  end
end

require "openxml/element"
require "openxml/has_children"
require "openxml/docx/elements/text"
Dir.glob("#{File.join(File.dirname(__FILE__), "elements", "*.rb")}").each do |file|
  require file
end
