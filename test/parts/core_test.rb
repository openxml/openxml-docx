require 'test_helper'

class CoreTest < Test::Unit::TestCase
  attr_reader :core

  context "creating a new core" do
    setup do
      @core = Rocx::Parts::Core.new
    end

    should "set the initial title to ''" do
      assert_equal "", core.title
    end

    should "set the initial subject to ''" do
      assert_equal "", core.subject
    end

    should "set the initial creator to ''" do
      assert_equal "", core.creator
    end

    should "set the initial keywords to ''" do
      assert_equal "", core.keywords
    end

    should "set the initial revision to 1" do
      assert_equal 1, core.revision
    end

    should "set the initial category to ''" do
      assert_equal "", core.category
    end

    should "set the initial description to ''" do
      assert_equal "", core.description
    end

    should "set the initial last_modified_by to ''" do
      assert_equal "", core.last_modified_by
    end
  end

  context "transforming to XML" do
    should "output the correct XML" do
      Timecop.freeze(Time.local(2014, 3, 7, 10, 29, 48)) do
        @core = Rocx::Parts::Core.new
        assert_equal part_xml('initial_core'), core.to_xml
      end
    end
  end

end
