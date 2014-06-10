require "spec_helper"

describe Rocx::Properties::ContextualSpacing do
  include ValuePropertyTestMacros

  it_should_use tag: :contextualSpacing, name: "contextual_spacing"

  with_value(true) do
    it_should_work
    it_should_output "<w:contextualSpacing/>"
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
