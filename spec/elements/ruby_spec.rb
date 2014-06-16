require "spec_helper"

describe Rocx::Elements::Ruby do
  include ElementTestMacros

  it_should_use tag: :ruby, name: "ruby"

  it_should_have_property :font_size, as_instance_of: :phonetic_guide_font_size, with_value: 1
  it_should_have_property :base_font_size, as_instance_of: :phonetic_guide_base_font_size, with_value: 1
  it_should_have_property :font_size_raise, as_instance_of: :phonetic_guide_font_size_raise, with_value: 1
  it_should_have_property :language, as_instance_of: :phonetic_guide_language, with_value: "ja-JP"

end
