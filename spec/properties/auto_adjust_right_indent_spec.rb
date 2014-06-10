require "spec_helper"

describe Rocx::Properties::AutoAdjustRightIndent do
  include ValuePropertyTestMacros

  it_should_use tag: :adjustRightInd, name: "auto_adjust_right_ind"

  with_value(true) do
    it_should_work
    it_should_output "<w:adjustRightInd w:val=\"true\"/>"
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
