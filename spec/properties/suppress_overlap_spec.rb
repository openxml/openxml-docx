require "spec_helper"

describe OpenXml::Docx::Properties::SuppressOverlap do
  include ValuePropertyTestMacros

  it_should_use tag: :suppressOverlap, name: "suppress_overlap", value: true

  with_value(true) do
    it_should_work
    it_should_output "<w:suppressOverlap/>"
  end

  with_value(false) do
    it_should_work
    it_should_output "<w:suppressOverlap w:val=\"false\"/>"
  end

  with_value(nil) do
    it_should_not_work
  end

end
