require "spec_helper"

describe OpenXml::Docx::Properties::MirrorIndent do
  include ValuePropertyTestMacros

  it_should_use tag: :mirrorIndent, name: "mirror_indent", value: true

  with_value(true) do
    it_should_work
    it_should_output "<w:mirrorIndent/>"
  end

  with_value(false) do
    it_should_work
    it_should_output "<w:mirrorIndent w:val=\"false\"/>"
  end

  with_value(nil) do
    it_should_not_work
  end

end
