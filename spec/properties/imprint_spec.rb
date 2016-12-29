require "spec_helper"

describe OpenXml::Docx::Properties::Imprint do
  include ValuePropertyTestMacros

  it_should_use tag: :imprint, name: "imprint", value: true

  with_value(true) do
    it_should_work
    it_should_output "<w:imprint/>"
  end

  with_value(false) do
    it_should_work
    it_should_output "<w:imprint w:val=\"false\"/>"
  end

  with_value(nil) do
    it_should_not_work
  end

end
