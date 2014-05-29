require "test_helper"

class TextboxTightWrapTest < PropertyTest
  attr_reader :textbox_tight_wrap

  context "always" do
    setup do
      @textbox_tight_wrap = TextboxTightWrap.new(:allLines)
    end

    should "have the right tag" do
      assert_equal :textboxTightWrap, textbox_tight_wrap.tag
    end

    should "have the right name" do
      assert_equal "textbox_tight_wrap", textbox_tight_wrap.name
    end
  end

  context "with valid values," do
    context "like :allLines, it" do
      setup do
        @textbox_tight_wrap = TextboxTightWrap.new(:allLines)
      end

      should "return the right XML" do
        assert_equal "<w:textboxTightWrap w:val=\"allLines\"/>", xml(textbox_tight_wrap)
      end
    end
  end

  context "with valid values," do
    context "like :firstAndLastLine, it" do
      setup do
        @textbox_tight_wrap = TextboxTightWrap.new(:firstAndLastLine)
      end

      should "return the right XML" do
        assert_equal "<w:textboxTightWrap w:val=\"firstAndLastLine\"/>", xml(textbox_tight_wrap)
      end
    end
  end

  context "with valid values," do
    context "like :firstLineOnly, it" do
      setup do
        @textbox_tight_wrap = TextboxTightWrap.new(:firstLineOnly)
      end

      should "return the right XML" do
        assert_equal "<w:textboxTightWrap w:val=\"firstLineOnly\"/>", xml(textbox_tight_wrap)
      end
    end
  end

  context "with valid values," do
    context "like :lastLineOnly, it" do
      setup do
        @textbox_tight_wrap = TextboxTightWrap.new(:lastLineOnly)
      end

      should "return the right XML" do
        assert_equal "<w:textboxTightWrap w:val=\"lastLineOnly\"/>", xml(textbox_tight_wrap)
      end
    end
  end

  context "with valid values," do
    context "like :none, it" do
      setup do
        @textbox_tight_wrap = TextboxTightWrap.new(:none)
      end

      should "return the right XML" do
        assert_equal "<w:textboxTightWrap w:val=\"none\"/>", xml(textbox_tight_wrap)
      end
    end
  end

  context "with invalid values, it" do
    should "raise an error" do
      assert_raises ArgumentError do
        @textbox_tight_wrap = TextboxTightWrap.new(:something_terrible)
      end
    end
  end

end
