require "spec_helper"

describe Rocx::Properties::Emboss do
  include ValuePropertyTestMacros

  it_should_use tag: :emboss, name: "emboss"

  with_value(true) do
    it_should_work
    it_should_output "<w:emboss/>"
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
