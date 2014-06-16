require "spec_helper"

describe Rocx::Elements::Ruby do
  include ElementTestMacros

  it_should_use tag: :ruby, name: "ruby"

  it_should_have_property :font_size, as_instance_of: :phonetic_guide_font_size, with_value: 1

end
