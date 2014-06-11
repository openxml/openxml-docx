require "spec_helper"

describe Rocx::Properties::RightToLeft do
  include ValuePropertyTestMacros

  it_should_use tag: :rtl, name: "right_to_left"

  with_value(true) do
    it_should_work
    it_should_output "<w:rtl/>"
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
