require "test_helper"

class TextTest < Test::Unit::TestCase
  attr_reader :text

  should "require space to be :preserve or nil" do
    assert_nothing_raised do
      @text = Rocx::Elements::Text.new("Banana", space: :preserve)
    end

    assert_nothing_raised do
      @text = Rocx::Elements::Text.new("Banana")
    end

    assert_raises ArgumentError do
      @text = Rocx::Elements::Text.new("Banana", space: :the_final_frontier)
    end
  end

  should "generate the proper XML" do
    @text = Rocx::Elements::Text.new("Banana", space: :preserve)
    text_xml = build_xml { |xml| text.to_xml(xml) }
    assert_equal element_xml("text"), text_xml
  end

end
