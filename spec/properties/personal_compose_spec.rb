require "spec_helper"

describe OpenXml::Docx::Properties::PersonalCompose do
  include ValuePropertyTestMacros

  it_should_use tag: :personalCompose, name: "personal_compose"

  with_value(true) do
    it_should_work
    it_should_output "<w:personalCompose w:val=\"true\"/>"
  end

  with_value(false) do
    it_should_work
    it_should_output ""
  end

  with_value(nil) do
    it_should_work
    it_should_output ""
  end

end
