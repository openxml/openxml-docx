require "spec_helper"

describe Rocx::Properties::SnapToGrid do
  include ValuePropertyTestMacros

  it_should_use tag: :snapToGrid, name: "snap_to_grid"

  with_value(:on) do
    it_should_work
    it_should_output "<w:snapToGrid w:val=\"on\"/>"
  end

  with_value(:off) do
    it_should_work
    it_should_output "<w:snapToGrid w:val=\"off\"/>"
  end

  with_value(nil) do
    it_should_work
    it_should_output ""
  end

end
