require "test_helper"

class RunTest < Test::Unit::TestCase
  attr_reader :run_node

  context "after creation, it" do
    setup do
      @run_node = Rocx::Elements::Run.new
      run_node.italics = true
    end

    should "render properties in the properties XML" do
      run_xml = build_xml { |xml| run_node.to_xml(xml) }
      assert_equal element_xml("run"), run_xml
    end
  end

end
