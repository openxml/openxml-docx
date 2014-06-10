require "spec_helper"

describe Rocx::Properties::ComplexScriptFormatting do
  include ValuePropertyTestMacros

  it_should_use tag: :cs, name: "complex_script_formatting"

  with_value(true) do
    it_should_work
    it_should_output "<w:cs/>"
  end

  with_value(false) do
    it_should_work
    it_should_output ""
  end

  with_value(nil) do
    it_should_work
    it_should_output ""
  end

end
