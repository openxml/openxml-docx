require "spec_helper"

describe Rocx::Properties::Position do
  include ValuePropertyTestMacros

  it_should_use tag: :position, name: "position", value: 1

  with_value(204) do
    it_should_work
    it_should_output "<w:position w:val=\"204\"/>"
  end

  with_value(-612) do
    it_should_work
    it_should_output "<w:position w:val=\"-612\"/>"
  end

  with_value(812.2) do
    it_should_not_work
  end

  with_value(:something_else) do
    it_should_not_work
  end

end
