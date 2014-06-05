require "test_helper"

class WebHiddenTest < PropertyTest
  attr_reader :web_hidden

  context "always" do
    setup do
      @web_hidden = WebHidden.new(false)
    end

    should "have the right tag" do
      assert_equal :webHidden, web_hidden.tag
    end

    should "have the right name" do
      assert_equal "web_hidden", web_hidden.name
    end
  end

  context "when the value is true, it" do
    setup do
      @web_hidden = WebHidden.new(true)
    end

    should "return XML" do
      assert_equal "<w:webHidden/>", xml(web_hidden)
    end
  end

  context "when the value is false, it" do
    setup do
      @web_hidden = WebHidden.new(false)
    end

    should "not return XML" do
      assert_equal "", xml(web_hidden)
    end
  end

  context "when the value is nil, it" do
    setup do
      @web_hidden = WebHidden.new(nil)
    end

    should "not return XML" do
      assert_equal "", xml(web_hidden)
    end
  end

end
