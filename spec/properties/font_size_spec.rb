require "spec_helper"

describe Rocx::Properties::FontSize do
  include ValuePropertyTestMacros

  it_should_use tag: :sz, name: "font_size", value: 22

  with_value(20) do
    it_should_work
    it_should_output "<w:sz w:val=\"20\"/>"
  end

  with_value(-20) do
    it_should_not_work
  end

  with_value(23.1) do
    it_should_not_work
  end

  with_value(:big) do
    it_should_not_work
  end
end
