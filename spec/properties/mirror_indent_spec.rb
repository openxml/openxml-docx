require "spec_helper"

describe Rocx::Properties::MirrorIndent do
  include ValuePropertyTestMacros

  it_should_use tag: :mirrorIndent, name: "mirror_indent"

  with_value(true) do
    it_should_work
    it_should_output "<w:mirrorIndent/>"
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
