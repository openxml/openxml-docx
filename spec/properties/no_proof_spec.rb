require "spec_helper"

describe OpenXml::Docx::Properties::NoProof do
  include ValuePropertyTestMacros

  it_should_use tag: :noProof, name: "no_proof"

  with_value(true) do
    it_should_work
    it_should_output "<w:noProof w:val=\"true\"/>"
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
