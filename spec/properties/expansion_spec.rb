require "spec_helper"

describe Rocx::Properties::Expansion do
  include ValuePropertyTestMacros

  it_should_use tag: :w, name: "expansion", value: "100%"

  with_value("1%") do
    it_should_work
    it_should_output "<w:w w:val=\"1%\"/>"
  end

  with_value(1) do
    it_should_not_work
  end

  with_value("0%") do
    it_should_not_work
  end

  with_value(600) do
    it_should_not_work
  end

  with_value("600%") do
    it_should_work
    it_should_output "<w:w w:val=\"600%\"/>"
  end

  with_value("601%") do
    it_should_not_work
  end

end
