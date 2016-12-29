require "spec_helper"

describe OpenXml::Docx::Properties::SpecVanish do
  include ValuePropertyTestMacros

  it_should_use tag: :specVanish, name: "spec_vanish", value: false

  with_value(true) do
    it_should_work
    it_should_output "<w:specVanish/>"
  end

  with_value(false) do
    it_should_work
    it_should_output "<w:specVanish w:val=\"false\"/>"
  end

  with_value(nil) do
    it_should_not_work
  end

end
