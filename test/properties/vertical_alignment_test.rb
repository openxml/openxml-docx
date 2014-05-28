require "test_helper"

class VerticalAlignmentTest < PropertyTest
  attr_reader :vertical_alignment

  context "always" do
    setup do
      @vertical_alignment = Rocx::Properties::VerticalAlignment.new(:auto)
    end

    should "have the right tag" do
      assert_equal :textAlignment, vertical_alignment.tag
    end

    should "have the right name" do
      assert_equal "vertical_alignment", vertical_alignment.name
    end
  end

  context "with valid values," do
    context "like :auto, it" do
      setup do
        @vertical_alignment = Rocx::Properties::VerticalAlignment.new(:auto)
      end

      should "return the right XML" do
        assert_equal "<w:textAlignment w:val=\"auto\"/>", xml(vertical_alignment)
      end
    end
  end

  context "with valid values," do
    context "like :baseline, it" do
      setup do
        @vertical_alignment = Rocx::Properties::VerticalAlignment.new(:baseline)
      end

      should "return the right XML" do
        assert_equal "<w:textAlignment w:val=\"baseline\"/>", xml(vertical_alignment)
      end
    end
  end

  context "with valid values," do
    context "like :bottom, it" do
      setup do
        @vertical_alignment = Rocx::Properties::VerticalAlignment.new(:bottom)
      end

      should "return the right XML" do
        assert_equal "<w:textAlignment w:val=\"bottom\"/>", xml(vertical_alignment)
      end
    end
  end

  context "with valid values," do
    context "like :center, it" do
      setup do
        @vertical_alignment = Rocx::Properties::VerticalAlignment.new(:center)
      end

      should "return the right XML" do
        assert_equal "<w:textAlignment w:val=\"center\"/>", xml(vertical_alignment)
      end
    end
  end

  context "with valid values," do
    context "like :top, it" do
      setup do
        @vertical_alignment = Rocx::Properties::VerticalAlignment.new(:top)
      end

      should "return the right XML" do
        assert_equal "<w:textAlignment w:val=\"top\"/>", xml(vertical_alignment)
      end
    end
  end

  context "with invalid values, it" do
    should "raise an error" do
      assert_raises ArgumentError do
        @vertical_alignment = Rocx::Properties::VerticalAlignment.new(:something_terrible)
      end
    end
  end

end
