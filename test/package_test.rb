require 'test_helper'

class PackageTest < Test::Unit::TestCase
  attr_reader :package

  context "when starting a new package" do
    setup do
      @package = Rocx::Package.new
    end

    should "create the content types part" do
      assert_is_a Rocx::Parts::ContentTypes, package.content_types
    end

    should "create the core part" do
      assert_is_a Rocx::Parts::Core, package.core
    end

    should "create the _rels part" do
      assert_is_a Rocx::Parts::Rels, package.rels
    end

    should "create the web settings part" do
      assert_is_a Rocx::Parts::WebSettings, package.web_settings
    end

  end

end
