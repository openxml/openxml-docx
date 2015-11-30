require "spec_helper"

describe OpenXml::Docx::Properties::FormProtection do
  include ValuePropertyTestMacros

  it_should_use tag: :formProt, name: "form_protection"

  with_value(true) do
    it_should_work
    it_should_output "<w:formProt/>"
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
