require "spec_helper"

describe Rocx::Elements::Ruby do
  include ElementTestMacros

  it_should_use tag: :ruby, name: "ruby"

  it_should_have_value_property :font_size, as_instance_of: :phonetic_guide_font_size, with_value: 1
  it_should_have_value_property :base_font_size, as_instance_of: :phonetic_guide_base_font_size, with_value: 1
  it_should_have_value_property :font_size_raise, as_instance_of: :phonetic_guide_font_size_raise, with_value: 1
  it_should_have_value_property :language, as_instance_of: :phonetic_guide_language, with_value: "ja-JP"
  it_should_have_value_property :alignment, as_instance_of: :phonetic_guide_alignment, with_value: :left

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

  context "for base text and ruby text" do
    before(:each) do
      @instance = described_class.new
      text = Rocx::Elements::Text.new("東̄")
      run = Rocx::Elements::Run.new
      run.bold = true
      run << text
      instance.base = run

      text = Rocx::Elements::Text.new("tō")
      run = Rocx::Elements::Run.new
      run.bold = true
      run << text
      instance.ruby = run
    end

    it_should_output "<w:ruby>\n    <w:rt>\n      <w:r>\n        <w:rPr>\n          <w:b/>\n        </w:rPr>\n        <w:t>to&#x304;</w:t>\n      </w:r>\n    </w:rt>\n    <w:rubyBase>\n      <w:r>\n        <w:rPr>\n          <w:b/>\n        </w:rPr>\n        <w:t>&#x6771;&#x304;</w:t>\n      </w:r>\n    </w:rubyBase>\n  </w:ruby>", assign: false
  end

  context "with base text, ruby text and properties set" do
    before(:each) do
      @instance = described_class.new
      text = Rocx::Elements::Text.new("東̄")
      run = Rocx::Elements::Run.new
      run.bold = true
      run << text
      instance.base = run

      text = Rocx::Elements::Text.new("tō")
      run = Rocx::Elements::Run.new
      run.bold = true
      run << text
      instance.ruby = run

      instance.alignment = :left
    end

    it_should_output "<w:ruby>\n    <w:rubyPr>\n      <w:rubyAlign w:val=\"left\"/>\n    </w:rubyPr>\n    <w:rt>\n      <w:r>\n        <w:rPr>\n          <w:b/>\n        </w:rPr>\n        <w:t>to&#x304;</w:t>\n      </w:r>\n    </w:rt>\n    <w:rubyBase>\n      <w:r>\n        <w:rPr>\n          <w:b/>\n        </w:rPr>\n        <w:t>&#x6771;&#x304;</w:t>\n      </w:r>\n    </w:rubyBase>\n  </w:ruby>", assign: false
  end

end
