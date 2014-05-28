require "test_helper"

class TextDirectionTest < PropertyTest
  attr_reader :text_direction

  context "always" do
    setup do
      @text_direction = Rocx::Properties::TextDirection.new(:lr)
    end

    should "have the right tag" do
      assert_equal :textDirection, text_direction.tag
    end

    should "have the right name" do
      assert_equal "text_direction", text_direction.name
    end
  end

  context "with valid values," do
    context "like :lr, it" do
      setup do
        @text_direction = Rocx::Properties::TextDirection.new(:lr)
      end

      should "return the right XML" do
        assert_equal "<w:textDirection w:val=\"lr\"/>", xml(text_direction)
      end
    end
  end

  context "with valid values," do
    context "like :lrV, it" do
      setup do
        @text_direction = Rocx::Properties::TextDirection.new(:lrV)
      end

      should "return the right XML" do
        assert_equal "<w:textDirection w:val=\"lrV\"/>", xml(text_direction)
      end
    end
  end

  context "with valid values," do
    context "like :rl, it" do
      setup do
        @text_direction = Rocx::Properties::TextDirection.new(:rl)
      end

      should "return the right XML" do
        assert_equal "<w:textDirection w:val=\"rl\"/>", xml(text_direction)
      end
    end
  end

  context "with valid values," do
    context "like :rlV, it" do
      setup do
        @text_direction = Rocx::Properties::TextDirection.new(:rlV)
      end

      should "return the right XML" do
        assert_equal "<w:textDirection w:val=\"rlV\"/>", xml(text_direction)
      end
    end
  end

  context "with valid values," do
    context "like :tb, it" do
      setup do
        @text_direction = Rocx::Properties::TextDirection.new(:tb)
      end

      should "return the right XML" do
        assert_equal "<w:textDirection w:val=\"tb\"/>", xml(text_direction)
      end
    end
  end

  context "with valid values," do
    context "like :tbV, it" do
      setup do
        @text_direction = Rocx::Properties::TextDirection.new(:tbV)
      end

      should "return the right XML" do
        assert_equal "<w:textDirection w:val=\"tbV\"/>", xml(text_direction)
      end
    end
  end

  context "with invalid values, it" do
    should "raise an error" do
      assert_raises ArgumentError do
        @text_direction = Rocx::Properties::TextDirection.new(:left_to_right)
      end
    end
  end

end
