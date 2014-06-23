require "spec_helper"

describe Rocx::Section do
  include ElementTestMacros

  it_should_have_property :bidi, as_instance_of: :bidi

end
