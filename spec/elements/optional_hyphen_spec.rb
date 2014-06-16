require "spec_helper"

describe Rocx::Elements::OptionalHyphen do
  include ElementTestMacros

  it_should_use tag: :softHyphen, name: "optional_hyphen"

  with_no_attributes_set do
    it_should_output "<w:softHyphen/>", assign: false
  end

end
