require "test_helper"

class ParagraphTest < Test::Unit::TestCase
  attr_reader :paragraph

  context "with runs, it" do
    setup do
      @paragraph = Rocx::Elements::Paragraph.new
      paragraph.indentation = {start: 720, end: -1440}
      run = Rocx::Elements::Run.new
      run << Rocx::Elements::Text.new("Hey Run 1")
      paragraph << run
      run = Rocx::Elements::Run.new
      run << Rocx::Elements::Text.new("Hey Run 2")
      paragraph << run
    end

    should "generate the proper XML" do
      paragraph_xml = build_xml { |xml| paragraph.to_xml(xml) }
      assert_equal element_xml("paragraph_with_runs"), paragraph_xml
    end
  end

  context "without runs, it" do
    setup do
      @paragraph = Rocx::Elements::Paragraph.new
      paragraph.alignment = :center
    end

    should "also generate the proper XML" do
      paragraph_xml = build_xml { |xml| paragraph.to_xml(xml) }

      assert_equal element_xml("paragraph"), paragraph_xml
    end
  end

end
