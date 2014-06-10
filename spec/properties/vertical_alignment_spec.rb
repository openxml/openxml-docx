require "spec_helper"

describe Rocx::Properties::VerticalAlignment do
  include ValuePropertyTestMacros

  it_should_use tag: :vertAlign, name: "vertical_alignment", value: :baseline

  with_value(:baseline) do
    it_should_work
    it_should_output "<w:vertAlign w:val=\"baseline\"/>"
  end

  with_value(:subscript) do
    it_should_work
    it_should_output "<w:vertAlign w:val=\"subscript\"/>"
  end

  with_value(:superscript) do
    it_should_work
    it_should_output "<w:vertAlign w:val=\"superscript\"/>"
  end

  with_value(:megascript) do
    it_should_not_work
  end
end
