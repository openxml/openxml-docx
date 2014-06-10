require "spec_helper"

describe Rocx::Properties::Italics do
  include ValuePropertyTestMacros

  it_should_use tag: :i, name: "italics"

  with_value(true) do
    it_should_work
    it_should_output "<w:i/>"
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