require "test_helper"

class SnapToGridTest < PropertyTest
  attr_reader :snap_to_grid

  context "always" do
    setup do
      @snap_to_grid = SnapToGrid.new(:on)
    end

    should "have the right tag" do
      assert_equal :snapToGrid, snap_to_grid.tag
    end

    should "have the right name" do
      assert_equal "snap_to_grid", snap_to_grid.name
    end
  end

  context "when the value is on, it" do
    setup do
      @snap_to_grid = SnapToGrid.new(:on)
    end

    should "return XML to that effect" do
      assert_equal "<w:snapToGrid w:val=\"on\"/>", xml(snap_to_grid)
    end
  end

  context "when the value is off, it" do
    setup do
      @snap_to_grid = SnapToGrid.new(:off)
    end

    should "return XML to that effect" do
      assert_equal "<w:snapToGrid w:val=\"off\"/>", xml(snap_to_grid)
    end
  end

  context "when the value is nil, it" do
    setup do
      @snap_to_grid = SnapToGrid.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(snap_to_grid)
    end
  end

end
