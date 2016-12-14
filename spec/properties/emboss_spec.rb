require "spec_helper"

describe OpenXml::Docx::Properties::Emboss do
  include ValuePropertyTestMacros

  it_should_use tag: :emboss, name: "emboss", value: true

  with_value(true) do
    it_should_work
    it_should_output "<w:emboss/>"
  end

  with_value(false) do
    it_should_work
    it_should_output "<w:emboss w:val=\"false\"/>"
  end

  with_value(nil) do
    it_should_not_work
  end

end
