require "spec_helper"

describe Rocx::Properties::TextAlignment do
  include ValuePropertyTestMacros

  it_should_use tag: :textAlignment, name: "text_alignment", value: :auto

  with_value(:auto) do
    it_should_work
    it_should_output "<w:textAlignment w:val=\"auto\"/>"
  end

  with_value(:baseline) do
    it_should_work
    it_should_output "<w:textAlignment w:val=\"baseline\"/>"
  end

  with_value(:bottom) do
    it_should_work
    it_should_output "<w:textAlignment w:val=\"bottom\"/>"
  end

  with_value(:center) do
    it_should_work
    it_should_output "<w:textAlignment w:val=\"center\"/>"
  end

  with_value(:top) do
    it_should_work
    it_should_output "<w:textAlignment w:val=\"top\"/>"
  end

end
