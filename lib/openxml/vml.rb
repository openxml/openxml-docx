module OpenXml
  module Vml
  end
end

# For now, we'll rely on Docx's basic implementations
require "openxml/docx/has_properties"
require "openxml/docx/properties"
require "openxml/docx/elements"
require "openxml/docx/package"
require "openxml/docx/parts"
require "openxml/docx/section"
require "openxml/docx/style"

# And then add our own stuff
require "openxml/vml/elements"
