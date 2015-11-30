require "spec_helper"

describe Rocx::Properties::StyleName do
  include ValuePropertyTestMacros

  it_should_use tag: :name, name: "style_name", value: "Something"

  with_value("Something") do
    it_should_work
    it_should_output "<w:name w:val=\"Something\"/>"
  end

  with_value("") do
    it_should_not_work
  end

end
