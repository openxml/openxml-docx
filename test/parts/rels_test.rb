require 'test_helper'

class RelsTest < Test::Unit::TestCase
  attr_reader :rels

  context "transforming to XML" do
    should "output the correct XML" do
      @rels = Rocx::Parts::Rels.new
      assert_equal part_xml('rels'), rels.to_xml
    end
  end

end
