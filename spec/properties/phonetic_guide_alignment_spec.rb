require "spec_helper"

describe OpenXml::Docx::Properties::PhoneticGuideAlignment do
  include ValuePropertyTestMacros

  it_should_use tag: :rubyAlign, name: "alignment", value: :left

  with_value(:center) do
    it_should_work
    it_should_output "<w:rubyAlign w:val=\"center\"/>"
  end

  with_value(:distributeLetter) do
    it_should_work
    it_should_output "<w:rubyAlign w:val=\"distributeLetter\"/>"
  end

  with_value(:distributeSpace) do
    it_should_work
    it_should_output "<w:rubyAlign w:val=\"distributeSpace\"/>"
  end

  with_value(:left) do
    it_should_work
    it_should_output "<w:rubyAlign w:val=\"left\"/>"
  end

  with_value(:right) do
    it_should_work
    it_should_output "<w:rubyAlign w:val=\"right\"/>"
  end

  with_value(:rightVertical) do
    it_should_work
    it_should_output "<w:rubyAlign w:val=\"rightVertical\"/>"
  end

  with_value(:nope) do
    it_should_not_work
  end

end
