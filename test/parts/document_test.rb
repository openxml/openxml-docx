require 'test_helper'

class DocumentTest < Test::Unit::TestCase
  attr_reader :document
  
  context "transforming to XML" do
    should "output the correct XML" do
      @document = Rocx::Parts::Document.new
      assert_equal part_xml('empty_document'), document.to_xml
    end
  end

end
