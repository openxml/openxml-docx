require "spec_helper"

describe OpenXml::Docx::Properties::Effect do
  include ValuePropertyTestMacros

  it_should_use tag: :effect, name: "effect", value: :none

  with_value(:antsBlack) do
    it_should_work
    it_should_output "<w:effect w:val=\"antsBlack\"/>"
  end

  with_value(:antsRed) do
    it_should_work
    it_should_output "<w:effect w:val=\"antsRed\"/>"
  end

  with_value(:blinkBackground) do
    it_should_work
    it_should_output "<w:effect w:val=\"blinkBackground\"/>"
  end

  with_value(:lights) do
    it_should_work
    it_should_output "<w:effect w:val=\"lights\"/>"
  end

  with_value(:none) do
    it_should_work
    it_should_output "<w:effect w:val=\"none\"/>"
  end

  with_value(:shimmer) do
    it_should_work
    it_should_output "<w:effect w:val=\"shimmer\"/>"
  end

  with_value(:sparkle) do
    it_should_work
    it_should_output "<w:effect w:val=\"sparkle\"/>"
  end

end
