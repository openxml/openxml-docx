require "spec_helper"

describe OpenXml::Docx::Properties::TextDirection do
  include ValuePropertyTestMacros

  it_should_use tag: :textDirection, name: "text_direction", value: :lr

  with_value(:lr) do
    it_should_work
    it_should_output "<w:textDirection w:val=\"lr\"/>"
  end

  with_value(:lrV) do
    it_should_work
    it_should_output "<w:textDirection w:val=\"lrV\"/>"
  end

  with_value(:rl) do
    it_should_work
    it_should_output "<w:textDirection w:val=\"rl\"/>"
  end

  with_value(:rlV) do
    it_should_work
    it_should_output "<w:textDirection w:val=\"rlV\"/>"
  end

  with_value(:tb) do
    it_should_work
    it_should_output "<w:textDirection w:val=\"tb\"/>"
  end

  with_value(:tbV) do
    it_should_work
    it_should_output "<w:textDirection w:val=\"tbV\"/>"
  end

  with_value(:left_to_right) do
    it_should_not_work
  end

end
