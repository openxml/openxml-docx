require "spec_helper"

describe Rocx::Elements::LongMonth do
  include ElementTestMacros

  it_should_use tag: :monthLong, name: "long_month"

  with_no_attributes_set do
    it_should_output "<w:monthLong/>", assign: false
  end

end
