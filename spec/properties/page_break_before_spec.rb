require "spec_helper"

describe Rocx::Properties::PageBreakBefore do
  include ValuePropertyTestMacros

  it_should_use tag: :pageBreakBefore, name: "page_break_before"

  with_value(true) do
    it_should_work
    it_should_output "<w:pageBreakBefore/>"
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
