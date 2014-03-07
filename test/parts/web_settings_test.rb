require 'test_helper'

class WebSettingsTest < Test::Unit::TestCase
  attr_reader :web_settings

  context "transforming to XML" do
    should "output the correct XML" do
      @web_settings = Rocx::Parts::WebSettings.new
      assert_equal part_xml('web_settings'), web_settings.to_xml
    end
  end

end
