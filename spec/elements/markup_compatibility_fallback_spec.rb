require "spec_helper"

describe OpenXml::Docx::Elements::MarkupCompatibilityFallback do
  include ElementTestMacros

  it_should_use tag: :Fallback, name: "markup_compatibility_fallback"

  with_no_attributes_set do
    it_should_output "<mc:Fallback/>", assign: false
  end
end
