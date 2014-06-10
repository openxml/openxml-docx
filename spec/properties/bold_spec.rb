require "spec_helper"

describe Rocx::Properties::Bold do
  include ValuePropertyTestMacros

  it_should_use tag: :b, name: "bold"

  with_value(true) do
    it_should_work
    it_should_output "<w:b/>"
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
