require "spec_helper"

describe Rocx::Elements::LongDay do
  include ElementTestMacros

  it_should_use tag: :dayLong, name: "long_day"

  with_no_attributes_set do
    it_should_output "<w:dayLong/>", assign: false
  end

end
