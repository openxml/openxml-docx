require "spec_helper"

describe OpenXml::Docx::Elements::MarkupCompatibilityAlternateContent do
  include ElementTestMacros

  it_should_use tag: :AlternateContent, name: "markup_compatibility_alternate_content"

  with_no_attributes_set do
    it_should_output "<mc:AlternateContent/>", assign: false
  end
end
