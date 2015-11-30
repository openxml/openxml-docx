require "spec_helper"

describe OpenXml::Docx::Properties::CharacterSpacing do
  include ValuePropertyTestMacros

  it_should_use tag: :spacing, name: "character_spacing", value: 1

  with_value(400) do
    it_should_work
    it_should_output "<w:spacing w:val=\"400\"/>"
  end

  with_value(-230) do
    it_should_work
    it_should_output "<w:spacing w:val=\"-230\"/>"
  end

  with_value(4.2) do
    it_should_not_work
  end

  with_value(:twelve) do
    it_should_not_work
  end

end
