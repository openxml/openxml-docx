require "spec_helper"

describe Rocx::Properties::PrimaryStyle do
  include ValuePropertyTestMacros

  it_should_use tag: :qFormat, name: "primary_style"

  with_value(true) do
    it_should_work
    it_should_output "<w:qFormat/>"
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
