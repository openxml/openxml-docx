require "spec_helper"

describe OpenXml::Docx::Properties::GridAfter do
  include ValuePropertyTestMacros

  it_should_use tag: :gridAfter, name: "grid_after", value: 1

  with_value(400) do
    it_should_work
    it_should_output "<w:gridAfter w:val=\"400\"/>"
  end

  with_value(-230) do
    it_should_work
    it_should_output "<w:gridAfter w:val=\"-230\"/>"
  end

  with_value(4.2) do
    it_should_not_work
  end

  with_value(:twelve) do
    it_should_not_work
  end

end
