require 'test_helper'

class DocumentPartTest < ActiveSupport::TestCase
  
  test "document to_s should print out the xml document" do
    document = Rocx::Document.new do
      body
    end
    document.document.to_xml
    expected = <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<w:document xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mo="http://schemas.microsoft.com/office/mac/office/2008/main" xmlns:mv="urn:schemas-microsoft-com:mac:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" mc:Ignorable="w14 wp14">
  <w:body/>
</w:document>
    XML
    assert_equal expected, document.document.to_s
  end
  
  test "a heading should create a heading element in the document" do
    document = Rocx::Document.new do
      body do
        heading "Luke & Gene > everyone else", 1
      end
    end
    document.document.to_xml
    expected = <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<w:document xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mo="http://schemas.microsoft.com/office/mac/office/2008/main" xmlns:mv="urn:schemas-microsoft-com:mac:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" mc:Ignorable="w14 wp14">
  <w:body>
    <w:p>
      <w:pPr>
        <w:pStyle w:val="Heading1"/>
      </w:pPr>
      <w:r>
        <w:t>Luke &amp; Gene &gt; everyone else</w:t>
      </w:r>
    </w:p>
  </w:body>
</w:document>
XML
    assert_equal expected, document.document.to_s
  end
  
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
        paragraph ["This is a ", ["very", "ib"], " small ", ["paragraph", "u"]]
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
        <w:t>This is a </w:t>
      </w:r>
      <w:r>
        <w:rPr>
          <w:b/>
          <w:i/>
        </w:rPr>
        <w:t>very</w:t>
      </w:r>
      <w:r>
        <w:rPr/>
        <w:t> small </w:t>
      </w:r>
      <w:r>
        <w:rPr>
          <w:u w:val="single"/>
        </w:rPr>
        <w:t>paragraph</w:t>
      </w:r>
    </w:p>
  </w:body>
</w:document>
    XML
    assert_equal expected, document.document.to_s
  end
  
  test "bullet should create a paragraph of ListBullet type" do
    document = Rocx::Document.new do
      body do
        bullet "Bob"
        bullet "Luke"
        bullet "Jesse"
        bullet "And the rest"
      end
    end
    document.document.to_xml
    expected = <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<w:document xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mo="http://schemas.microsoft.com/office/mac/office/2008/main" xmlns:mv="urn:schemas-microsoft-com:mac:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" mc:Ignorable="w14 wp14">
  <w:body>
    <w:p>
      <w:pPr>
        <w:pStyle w:val="ListBullet"/>
        <w:numPr>
          <w:ilvl w:val="0"/>
          <w:numId w:val="2"/>
        </w:numPr>
      </w:pPr>
      <w:r>
        <w:t>Bob</w:t>
      </w:r>
    </w:p>
    <w:p>
      <w:pPr>
        <w:pStyle w:val="ListBullet"/>
        <w:numPr>
          <w:ilvl w:val="0"/>
          <w:numId w:val="2"/>
        </w:numPr>
      </w:pPr>
      <w:r>
        <w:t>Luke</w:t>
      </w:r>
    </w:p>
    <w:p>
      <w:pPr>
        <w:pStyle w:val="ListBullet"/>
        <w:numPr>
          <w:ilvl w:val="0"/>
          <w:numId w:val="2"/>
        </w:numPr>
      </w:pPr>
      <w:r>
        <w:t>Jesse</w:t>
      </w:r>
    </w:p>
    <w:p>
      <w:pPr>
        <w:pStyle w:val="ListBullet"/>
        <w:numPr>
          <w:ilvl w:val="0"/>
          <w:numId w:val="2"/>
        </w:numPr>
      </w:pPr>
      <w:r>
        <w:t>And the rest</w:t>
      </w:r>
    </w:p>
  </w:body>
</w:document>
    XML
    assert_equal expected, document.document.to_s
  end
  
  test "stupid table" do
    document = Rocx::Document.new do
      body do
        table [
          ["Luke", "Awesome"],
          ["Gene", "Awesome"],
          ["Jesse", "Nope"],
          ["Bob", "Nope"]
        ]
      end
    end
    document.document.to_xml
    expected = <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<w:document xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mo="http://schemas.microsoft.com/office/mac/office/2008/main" xmlns:mv="urn:schemas-microsoft-com:mac:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" mc:Ignorable="w14 wp14">
  <w:body>
    <w:tbl>
      <w:tblPr>
        <w:tblStyle w:val=""/>
        <w:tblW w:w="100" w:type="pct"/>
        <w:look w:val="0400"/>
      </w:tblPr>
      <w:tblGrid>
        <w:gridCol w:w="50"/>
        <w:gridCol w:w="50"/>
      </w:tblGrid>
      <w:tr>
        <w:tc>
          <w:tcPr>
            <w:tcW w:w="0" w:type="auto"/>
          </w:tcPr>
          <w:p>
            <w:pPr>
              <w:pStyle w:val="BodyText"/>
              <w:jc w:val="left"/>
            </w:pPr>
            <w:r>
              <w:rPr/>
              <w:t>Luke</w:t>
            </w:r>
          </w:p>
        </w:tc>
        <w:tc>
          <w:tcPr>
            <w:tcW w:w="0" w:type="auto"/>
          </w:tcPr>
          <w:p>
            <w:pPr>
              <w:pStyle w:val="BodyText"/>
              <w:jc w:val="left"/>
            </w:pPr>
            <w:r>
              <w:rPr/>
              <w:t>Awesome</w:t>
            </w:r>
          </w:p>
        </w:tc>
      </w:tr>
      <w:tr>
        <w:tc>
          <w:tcPr>
            <w:tcW w:w="0" w:type="auto"/>
          </w:tcPr>
          <w:p>
            <w:pPr>
              <w:pStyle w:val="BodyText"/>
              <w:jc w:val="left"/>
            </w:pPr>
            <w:r>
              <w:rPr/>
              <w:t>Gene</w:t>
            </w:r>
          </w:p>
        </w:tc>
        <w:tc>
          <w:tcPr>
            <w:tcW w:w="0" w:type="auto"/>
          </w:tcPr>
          <w:p>
            <w:pPr>
              <w:pStyle w:val="BodyText"/>
              <w:jc w:val="left"/>
            </w:pPr>
            <w:r>
              <w:rPr/>
              <w:t>Awesome</w:t>
            </w:r>
          </w:p>
        </w:tc>
      </w:tr>
      <w:tr>
        <w:tc>
          <w:tcPr>
            <w:tcW w:w="0" w:type="auto"/>
          </w:tcPr>
          <w:p>
            <w:pPr>
              <w:pStyle w:val="BodyText"/>
              <w:jc w:val="left"/>
            </w:pPr>
            <w:r>
              <w:rPr/>
              <w:t>Jesse</w:t>
            </w:r>
          </w:p>
        </w:tc>
        <w:tc>
          <w:tcPr>
            <w:tcW w:w="0" w:type="auto"/>
          </w:tcPr>
          <w:p>
            <w:pPr>
              <w:pStyle w:val="BodyText"/>
              <w:jc w:val="left"/>
            </w:pPr>
            <w:r>
              <w:rPr/>
              <w:t>Nope</w:t>
            </w:r>
          </w:p>
        </w:tc>
      </w:tr>
      <w:tr>
        <w:tc>
          <w:tcPr>
            <w:tcW w:w="0" w:type="auto"/>
          </w:tcPr>
          <w:p>
            <w:pPr>
              <w:pStyle w:val="BodyText"/>
              <w:jc w:val="left"/>
            </w:pPr>
            <w:r>
              <w:rPr/>
              <w:t>Bob</w:t>
            </w:r>
          </w:p>
        </w:tc>
        <w:tc>
          <w:tcPr>
            <w:tcW w:w="0" w:type="auto"/>
          </w:tcPr>
          <w:p>
            <w:pPr>
              <w:pStyle w:val="BodyText"/>
              <w:jc w:val="left"/>
            </w:pPr>
            <w:r>
              <w:rPr/>
              <w:t>Nope</w:t>
            </w:r>
          </w:p>
        </w:tc>
      </w:tr>
    </w:tbl>
  </w:body>
</w:document>
    XML
    assert_equal expected, document.document.to_s
  end
  
  test "tables with borders" do
    document = Rocx::Document.new do
      body do
        heading "Hey bordered table"
        table [
          ["I", "Have", "Borders"]
        ], borders: "yeah", border_type: 'wave', border_color: "#dfdfdf"
      end
    end
    document.document.to_xml
    expected = <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<w:document xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mo="http://schemas.microsoft.com/office/mac/office/2008/main" xmlns:mv="urn:schemas-microsoft-com:mac:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" mc:Ignorable="w14 wp14">
  <w:body>
    <w:p>
      <w:pPr>
        <w:pStyle w:val="Heading1"/>
      </w:pPr>
      <w:r>
        <w:t>Hey bordered table</w:t>
      </w:r>
    </w:p>
    <w:tbl>
      <w:tblPr>
        <w:tblStyle w:val=""/>
        <w:tblW w:w="100" w:type="pct"/>
        <w:tblBorders>
          <w:top w:color="#dfdfdf" w:space="0" w:sz="4" w:val="wave"/>
          <w:left w:color="#dfdfdf" w:space="0" w:sz="4" w:val="wave"/>
          <w:bottom w:color="#dfdfdf" w:space="0" w:sz="4" w:val="wave"/>
          <w:right w:color="#dfdfdf" w:space="0" w:sz="4" w:val="wave"/>
          <w:insideH w:color="#dfdfdf" w:space="0" w:sz="4" w:val="wave"/>
          <w:insideV w:color="#dfdfdf" w:space="0" w:sz="4" w:val="wave"/>
        </w:tblBorders>
        <w:look w:val="0400"/>
      </w:tblPr>
      <w:tblGrid>
        <w:gridCol w:w="33"/>
        <w:gridCol w:w="33"/>
        <w:gridCol w:w="33"/>
      </w:tblGrid>
      <w:tr>
        <w:tc>
          <w:tcPr>
            <w:tcW w:w="0" w:type="auto"/>
          </w:tcPr>
          <w:p>
            <w:pPr>
              <w:pStyle w:val="BodyText"/>
              <w:jc w:val="left"/>
            </w:pPr>
            <w:r>
              <w:rPr/>
              <w:t>I</w:t>
            </w:r>
          </w:p>
        </w:tc>
        <w:tc>
          <w:tcPr>
            <w:tcW w:w="0" w:type="auto"/>
          </w:tcPr>
          <w:p>
            <w:pPr>
              <w:pStyle w:val="BodyText"/>
              <w:jc w:val="left"/>
            </w:pPr>
            <w:r>
              <w:rPr/>
              <w:t>Have</w:t>
            </w:r>
          </w:p>
        </w:tc>
        <w:tc>
          <w:tcPr>
            <w:tcW w:w="0" w:type="auto"/>
          </w:tcPr>
          <w:p>
            <w:pPr>
              <w:pStyle w:val="BodyText"/>
              <w:jc w:val="left"/>
            </w:pPr>
            <w:r>
              <w:rPr/>
              <w:t>Borders</w:t>
            </w:r>
          </w:p>
        </w:tc>
      </w:tr>
    </w:tbl>
  </w:body>
</w:document>
    XML
    assert_equal expected, document.document.to_s
  end
  
  # test "bullet points with different styles" do
  #   document = Rocx::Document.new do
  #     body do
  #       bullet "Color blob", style: 14
  #     end
  #   end
  #   assert true
  # end
  # 
  # test "bullet points with different indent levels" do
  #   document = Rocx::Document.new do
  #     body do
  #       bullet "Red", level: 0
  #       bullet "Green", level: 0
  #       bullet "Yellow", level: 1
  #       bullet "Black", level: 2
  #       bullet "Orange", level: 0
  #     end
  #   end
  #   document.save(File.expand_path("~/Desktop/bullet-bonanza.docx"))
  #   assert true
  # end
end