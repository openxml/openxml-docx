require "test_helper"

class GlobalRelsTest < Test::Unit::TestCase
  attr_reader :global_rels

  context "transforming to XML" do
    should "output the correct XML" do
      @global_rels = Rocx::Parts::GlobalRels.new
      assert_equal part_xml('global_rels').strip, global_rels.to_xml
    end
  end

end
