require "spec_helper"

describe OpenXml::Docx::Properties::TitlePage do
  include ValuePropertyTestMacros

  it_should_use tag: :titlePg, name: "title_page", value: true

  with_value(true) do
    it_should_work
    it_should_output "<w:titlePg/>"
  end

  with_value(false) do
    it_should_work
    it_should_output "<w:titlePg w:val=\"false\"/>"
  end

  with_value(nil) do
    it_should_not_work
  end

end
