require "spec_helper"

describe Rocx::Properties::StyleAliases do
  include ValuePropertyTestMacros

  it_should_use tag: :aliases, name: "style_aliases", value: "Default"

  with_value("AltStyleName") do
    it_should_work
    it_should_output "<w:aliases w:val=\"AltStyleName\"/>"
  end

  with_value("AltStyleName1,Alt Style Name 2") do
    it_should_work
    it_should_output "<w:aliases w:val=\"AltStyleName1,Alt Style Name 2\"/>"
  end

  with_value(5) do
    it_should_not_work
  end

end
