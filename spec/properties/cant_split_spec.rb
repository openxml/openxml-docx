require "spec_helper"

describe OpenXml::Docx::Properties::CantSplit do
  include ValuePropertyTestMacros

  it_should_use tag: :cantSplit, name: "cant_split", value: true

  with_value(true) do
    it_should_work
    it_should_output "<w:cantSplit/>"
  end

  with_value(false) do
    it_should_work
    it_should_output "<w:cantSplit w:val=\"false\"/>"
  end

  with_value(nil) do
    it_should_not_work
  end

end
