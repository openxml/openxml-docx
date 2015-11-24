module Rocx
  REL_DOCUMENT = "http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument".freeze
  REL_STYLES = "http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles".freeze
  REL_SETTINGS = "http://schemas.openxmlformats.org/officeDocument/2006/relationships/settings".freeze

  TYPE_STYLES = "application/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml".freeze
  TYPE_SETTINGS = "application/vnd.openxmlformats-officedocument.wordprocessingml.settings+xml".freeze
  TYPE_XML = "application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml".freeze
end

require "rocx/attribute_builder"
require "rocx/property_builder"
require "rocx/properties"
require "rocx/elements"
require "rocx/package"
require "rocx/parts"
require "rocx/section"
require "rocx/style"
