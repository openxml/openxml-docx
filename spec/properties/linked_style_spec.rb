require "spec_helper"

describe OpenXml::Docx::Properties::LinkedStyle do
  include ValuePropertyTestMacros

  it_should_use tag: :link, name: "linked_style", value: "Something"

  with_value("Something") do
    it_should_work
    it_should_output "<w:link w:val=\"Something\"/>"
  end

  with_value("") do
    it_should_not_work
  end

end
