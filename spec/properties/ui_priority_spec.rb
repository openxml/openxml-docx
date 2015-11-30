require "spec_helper"

describe Rocx::Properties::UiPriority do
  include ValuePropertyTestMacros

  it_should_use tag: :uiPriority, name: "ui_priority", value: 1

  with_value(2) do
    it_should_work
    it_should_output "<w:uiPriority w:val=\"2\"/>"
  end

  with_value(-2) do
    it_should_work
    it_should_output "<w:uiPriority w:val=\"-2\"/>"
  end

  with_value(:low) do
    it_should_not_work
  end

end
