require "test_helper"

class BreakTest < Test::Unit::TestCase
  attr_reader :break_node

  context "when creating a new break, it" do
    should "not accept invalid values for the clear property" do
      assert_raises ArgumentError do
        @break_node = Rocx::Elements::Break.new(clear: :obviouslyInvalid)
      end
    end

    should "not accept invalid values for the break_type property" do
      assert_raises ArgumentError do
        @break_node = Rocx::Elements::Break.new(break_type: :invalidType)
      end
    end
  end

  context "after initial creation, it" do
    should "still not accept invalid values for the clear property" do
      assert_raises ArgumentError do
        @break_node = Rocx::Elements::Break.new
        break_node.clear = :invalid
      end
    end

    should "still not accept invalid values for the break_type property" do
      assert_raises ArgumentError do
        @break_node = Rocx::Elements::Break.new
        break_node.break_type :weird
      end
    end
  end

  context "when generating XML" do
    context "and both property is nil, it" do
      should "omit the attributes" do
        @break_node = Rocx::Elements::Break.new
        break_xml = build_xml { |xml| break_node.to_xml(xml) }
        assert_equal element_xml("break"), break_xml
      end
    end

    context "and a property isn't nil, it" do
      should "include that attribute" do
        @break_node = Rocx::Elements::Break.new(break_type: :page, clear: :left)
        break_xml = build_xml { |xml| break_node.to_xml(xml) }
        assert_equal element_xml("break_with_attributes"), break_xml
      end
    end
  end

private

  def build_xml
    Nokogiri::XML::Builder.new { |xml| yield xml }.to_xml
  end

end
