require "spec_helper"

describe Rocx::Properties::ParagraphStyle do
  include ValuePropertyTestMacros

  it_should_use tag: :pStyle, name: "paragraph_style", value: "Nope"

  with_value("Nope") do
    it_should_work
    it_should_output "<w:pStyle w:val=\"Nope\"/>"
  end
end
