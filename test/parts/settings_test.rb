require 'test_helper'

class SettingsTest < Test::Unit::TestCase
  attr_reader :settings

  context "transforming to XML" do
    should "output the correct XML" do
      @settings = Rocx::Parts::Settings.new
      assert_equal part_xml('settings').strip, settings.to_xml
    end
  end

end
