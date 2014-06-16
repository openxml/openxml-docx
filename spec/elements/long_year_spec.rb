require "spec_helper"

describe Rocx::Elements::LongYear do
  include ElementTestMacros

  it_should_use tag: :yearLong, name: "long_year"

  with_no_attributes_set do
    it_should_output "<w:yearLong/>", assign: false
  end

end
