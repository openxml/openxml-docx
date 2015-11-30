require "spec_helper"

describe OpenXml::Docx::Elements::CarriageReturn do
  include ElementTestMacros

  it_should_use tag: :cr, name: "carriage_return"

  with_no_attributes_set do
    it_should_output "<w:cr/>", assign: false
  end

end
