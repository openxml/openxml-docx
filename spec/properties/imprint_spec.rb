require "spec_helper"

describe Rocx::Properties::Imprint do
  include ValuePropertyTestMacros

  it_should_use tag: :imprint, name: "imprint"

  with_value(true) do
    it_should_work
    it_should_output "<w:imprint/>"
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
