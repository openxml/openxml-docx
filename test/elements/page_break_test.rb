require 'test_helper'

class PageBreakTest < ActiveSupport::TestCase
  
  test "page_break should raise an error if given an invalid type" do
    assert_raises(ArgumentError) do
      document = Rocx::Document.new do
        body do
          page_break type: :banana
        end
      end
    end
  end

  test "page_break should create a page break element in the document" do
    document = Rocx::Document.new do
      body do
        page_break
      end
    end
    document.document.to_xml
    expected = <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<w:document xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mo="http://schemas.microsoft.com/office/mac/office/2008/main" xmlns:mv="urn:schemas-microsoft-com:mac:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" mc:Ignorable="w14 wp14">
  <w:body>
    <w:p>
      <w:r>
        <w:br w:type="page"/>
      </w:r>
    </w:p>
  </w:body>
</w:document>
    XML
    assert_equal expected, document.document.to_s
  end
  
end