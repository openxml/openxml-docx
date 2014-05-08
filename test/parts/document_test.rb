require "test_helper"

class DocumentTest < Test::Unit::TestCase
  attr_reader :document

  context "with child elements, it" do
    setup do
      @document = Rocx::Parts::Document.new
      paragraph = Rocx::Elements::Paragraph.new
      paragraph << Rocx::Elements::Run.new("This is just a test run.")
      paragraph << Rocx::Elements::Run.new("But this isn't!")
      document << paragraph
    end

    should "output the correct XML" do
      assert_equal part_xml("document_with_children").strip, document.read
    end
  end

  context "transforming to XML" do
    should "output the correct XML" do
      @document = Rocx::Parts::Document.new
      assert_equal part_xml("empty_document").strip, document.read
    end
  end

end
