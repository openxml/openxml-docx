module OpenXml
  module DrawingML
  end
end

# For now, we'll rely on Docx's basic implementations
require "openxml/docx/attribute_builder"
require "openxml/docx/property_builder"
require "openxml/docx/properties"
require "openxml/docx/elements"
require "openxml/docx/package"
require "openxml/docx/parts"
require "openxml/docx/section"
require "openxml/docx/style"

# And then add our own stuff
require "openxml/drawingml/elements"
