require "spec_helper"

describe Rocx::Properties::HiddenText do
  include ValuePropertyTestMacros

  it_should_use tag: :vanish, name: "hidden_text"

  with_value(true) do
    it_should_work
    it_should_output "<w:vanish/>"
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
