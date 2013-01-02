require 'test_helper'

class WebSettingsPartTest < ActiveSupport::TestCase
  
  test "document should create a web settings part" do
    document = Rocx::Document.new
    document.web_settings.to_xml
    expected = <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<w:webSettings xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" mc:Ignorable="w14">
  <w:allowPNG/>
  <w:doNotSaveAsSingleFile/>
</w:webSettings>
    XML

    assert_equal expected, document.web_settings.to_s
  end
  
end
