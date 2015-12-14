module OpenXml
  module Docx
    REL_DOCUMENT = "http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument".freeze
    REL_STYLES = "http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles".freeze
    REL_SETTINGS = "http://schemas.openxmlformats.org/officeDocument/2006/relationships/settings".freeze
    REL_HEADER = "http://schemas.openxmlformats.org/officeDocument/2006/relationships/header".freeze
    REL_FOOTER = "http://schemas.openxmlformats.org/officeDocument/2006/relationships/footer".freeze

    TYPE_STYLES = "application/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml".freeze
    TYPE_SETTINGS = "application/vnd.openxmlformats-officedocument.wordprocessingml.settings+xml".freeze
    TYPE_HEADER = "application/vnd.openxmlformats-officedocument.wordprocessingml.header+xml".freeze
    TYPE_FOOTER = "application/vnd.openxmlformats-officedocument.wordprocessingml.footer+xml".freeze
    TYPE_XML = "application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml".freeze
  end
end

require "openxml/docx/attribute_builder"
require "openxml/docx/property_builder"
require "openxml/docx/properties"
require "openxml/docx/root_namespaces"
require "openxml/docx/elements"
require "openxml/docx/package"
require "openxml/docx/parts"
require "openxml/docx/section"
require "openxml/docx/style"
