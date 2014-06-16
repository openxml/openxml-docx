require "spec_helper"

describe Rocx::Elements::NonbreakingHyphen do
  include ElementTestMacros

  it_should_use tag: :noBreakHyphen, name: "nonbreaking_hyphen"

  with_no_attributes_set do
    it_should_output "<w:noBreakHyphen/>", assign: false
  end

end
