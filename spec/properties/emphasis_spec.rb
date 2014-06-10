require "spec_helper"

describe Rocx::Properties::Emphasis do
  include ValuePropertyTestMacros

  it_should_use tag: :em, name: "emphasis", value: :circle

  with_value(:circle) do
    it_should_work
    it_should_output "<w:em w:val=\"circle\"/>"
  end

  with_value(:comma) do
    it_should_work
    it_should_output "<w:em w:val=\"comma\"/>"
  end

  with_value(:dot) do
    it_should_work
    it_should_output "<w:em w:val=\"dot\"/>"
  end

  with_value(:none) do
    it_should_work
    it_should_output "<w:em w:val=\"none\"/>"
  end

  with_value(:underDot) do
    it_should_work
    it_should_output "<w:em w:val=\"underDot\"/>"
  end

  with_value(:somethingElse) do
    it_should_not_work
  end

end
