require "spec_helper"

describe OpenXml::Docx::Properties::Kinsoku do
  include ValuePropertyTestMacros

  it_should_use tag: :kinsoku, name: "kinsoku"

  with_value(:on) do
    it_should_work
    it_should_output "<w:kinsoku w:val=\"on\"/>"
  end

  with_value(:off) do
    it_should_work
    it_should_output "<w:kinsoku w:val=\"off\"/>"
  end

  with_value(nil) do
    it_should_work
    it_should_output ""
  end

end
