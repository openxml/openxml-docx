require "spec_helper"

describe Rocx::Elements::Ruby do
  include ElementTestMacros

  it_should_use tag: :ruby, name: "ruby"

  it_should_have_property :font_size, as_instance_of: :phonetic_guide_font_size, with_value: 1
  it_should_have_property :base_font_size, as_instance_of: :phonetic_guide_base_font_size, with_value: 1
  it_should_have_property :font_size_raise, as_instance_of: :phonetic_guide_font_size_raise, with_value: 1
  it_should_have_property :language, as_instance_of: :phonetic_guide_language, with_value: "ja-JP"
  it_should_have_property :alignment, as_instance_of: :phonetic_guide_alignment, with_value: :left

  context "for base text" do
    before(:each) do
      @instance = described_class.new
      text = Rocx::Elements::Text.new("Howdy Partner")
      run = Rocx::Elements::Run.new
      run << text
      instance.base = run
    end

    it_should_output "<w:ruby>\n    <w:rt/>\n    <w:rubyBase>\n      <w:r>\n        <w:t>Howdy Partner</w:t>\n      </w:r>\n    </w:rubyBase>\n  </w:ruby>", assign: false
  end


    end
  end

end
