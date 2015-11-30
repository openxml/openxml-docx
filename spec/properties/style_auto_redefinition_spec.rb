require "spec_helper"

describe Rocx::Properties::StyleAutoRedefinition do
  include ValuePropertyTestMacros

  it_should_use tag: :autoRedefine, name: "style_auto_redefinition"

  with_value(true) do
    it_should_work
    it_should_output "<w:autoRedefine/>"
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
