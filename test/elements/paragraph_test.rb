require 'test_helper'

class ParagraphTest < ActiveSupport::TestCase
  
  test "a paragraph with no special style should create a paragraph element in the document" do
    document = Rocx::Document.new do
      body do
        paragraph "This is a very small paragraph"
      end
    end
    document.document.to_xml
    expected = <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<w:document xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mo="http://schemas.microsoft.com/office/mac/office/2008/main" xmlns:mv="urn:schemas-microsoft-com:mac:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" mc:Ignorable="w14 wp14">
  <w:body>
    <w:p>
      <w:pPr>
        <w:pStyle w:val="BodyText"/>
        <w:jc w:val="left"/>
      </w:pPr>
      <w:r>
        <w:rPr/>
        <w:t>This is a very small paragraph</w:t>
      </w:r>
    </w:p>
  </w:body>
</w:document>
    XML
    assert_equal expected, document.document.to_s
  end

  test "a paragraph with special style should create a paragraph element in the document" do
    document = Rocx::Document.new do
      body do
        paragraph ["This is a ", ["very ", :bold, :italic], "small ", ["paragraph", :underline]]
      end
    end
    document.document.to_xml
    expected = <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<w:document xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mo="http://schemas.microsoft.com/office/mac/office/2008/main" xmlns:mv="urn:schemas-microsoft-com:mac:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" mc:Ignorable="w14 wp14">
  <w:body>
    <w:p>
      <w:pPr>
        <w:pStyle w:val="BodyText"/>
        <w:jc w:val="left"/>
      </w:pPr>
      <w:r>
        <w:rPr/>
        <w:t xml:space="preserve">This is a </w:t>
      </w:r>
      <w:r>
        <w:rPr>
          <w:b/>
          <w:i/>
        </w:rPr>
        <w:t xml:space="preserve">very </w:t>
      </w:r>
      <w:r>
        <w:rPr/>
        <w:t xml:space="preserve">small </w:t>
      </w:r>
      <w:r>
        <w:rPr>
          <w:u w:val="single"/>
        </w:rPr>
        <w:t xml:space="preserve">paragraph</w:t>
      </w:r>
    </w:p>
  </w:body>
</w:document>
    XML
    assert_equal expected, document.document.to_s
  end
  
end