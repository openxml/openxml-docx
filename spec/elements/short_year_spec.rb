require "spec_helper"

describe Rocx::Elements::ShortYear do
  include ElementTestMacros

  it_should_use tag: :yearShort, name: "short_year"

  with_no_attributes_set do
    it_should_output "<w:yearShort/>", assign: false
  end

end
