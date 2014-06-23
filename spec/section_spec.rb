require "spec_helper"

describe Rocx::Section do
  include ElementTestMacros

  it_should_have_property :bidi
  it_should_have_property :form_protection
  it_should_have_property :rtl_gutter
  it_should_have_property :text_direction, with_value: :lr

end
