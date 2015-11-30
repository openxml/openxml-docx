require "spec_helper"

describe OpenXml::Docx::Properties::ParentStyle do
  include ValuePropertyTestMacros

  it_should_use tag: :basedOn, name: "parent_style", value: "Something"

  with_value("Something") do
    it_should_work
    it_should_output "<w:basedOn w:val=\"Something\"/>"
  end

  with_value(12.4) do
    it_should_not_work
  end

end
