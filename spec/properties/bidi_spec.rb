require "spec_helper"

describe Rocx::Properties::Bidi do
  include ValuePropertyTestMacros

  it_should_use tag: :bidi, name: "bidi"

  with_value(true) do
    it_should_work
    it_should_output "<w:bidi/>"
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