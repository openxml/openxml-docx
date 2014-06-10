require "spec_helper"

describe Rocx::Properties::KeepLines do
  include ValuePropertyTestMacros

  it_should_use tag: :keepLines, name: "keep_lines"

  with_value(true) do
    it_should_work
    it_should_output "<w:keepLines/>"
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
