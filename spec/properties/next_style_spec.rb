require "spec_helper"

describe Rocx::Properties::NextStyle do
  include ValuePropertyTestMacros

  it_should_use tag: :next, name: "next_style", value: "Style Name"

  with_value("The Name of a Style") do
    it_should_work
    it_should_output "<w:next w:val=\"The Name of a Style\"/>"
  end

  with_value("") do
    it_should_not_work
  end

end
