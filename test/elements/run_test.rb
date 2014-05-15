require "test_helper"

class RunTest < Test::Unit::TestCase
  attr_reader :run_node

  context "when creating a new run, it" do
    should "accept some properties" do
      @run_node = Rocx::Elements::Run.new("w:i" => {"w:val" => 0})
      expected_value = {"w:val" => 0}
      assert_equal expected_value, run_node["w:i"], "Expected the property to be set on the run when initialized with it"
    end
  end

  context "after creation, it" do
    setup do
      @run_node = Rocx::Elements::Run.new("w:i" => {"w:val" => 0})
    end

    should "be able to have additional properties set" do
      run_node["w:b"] = {"w:val" => 0}
      assert_equal 2, run_node.properties.length, "Expected the run's properties to be added"
    end

    should "return the proper XML" do
      run_node["w:b"] = {"w:val" => 0}
      run_node << Rocx::Elements::Text.new("")
      run_xml = build_xml do |xml|
        run_node.to_xml(xml)
      end
      assert_equal element_xml("run"), run_xml
    end
  end

private

  def build_xml
    Nokogiri::XML::Builder.new do |xml|
      xml.fakeDocument("xmlns:w" => "http://wnamespace.com") {
        yield xml
      }
    end.to_xml
  end

end
