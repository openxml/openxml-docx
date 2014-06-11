require "spec_helper"

describe Rocx::Properties::RunStyle do
  include ValuePropertyTestMacros

  it_should_use tag: :rStyle, name: "run_style", value: "Nope"

  with_value("Nope") do
    it_should_work
    it_should_output "<w:rStyle w:val=\"Nope\"/>"
  end
end
