require "spec_helper"

describe OpenXml::Docx::Properties::SupressOverlap do
  include ValuePropertyTestMacros

  it_should_use tag: :supressOverlap, name: "supress_overlap", value: true

  with_value(true) do
    it_should_work
    it_should_output "<w:supressOverlap/>"
  end

  with_value(false) do
    it_should_work
    it_should_output "<w:supressOverlap w:val=\"false\"/>"
  end

  with_value(nil) do
    it_should_not_work
  end

end
