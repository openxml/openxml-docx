require 'test_helper'

class DocumentPartTest < ActiveSupport::TestCase
  
  test "document to_s should print out the xml document" do
    document = Rocx::Document.new do
      body
    end
    expected = <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <w:body/>
</document>
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
<document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <w:body>
    <w:p>
      <w:pPr>
        <w:pStyle val="Heading1"/>
      </w:pPr>
      <w:r>
        <w:t>Luke &amp; Gene &gt; everyone else</w:t>
      </w:r>
    </w:p>
  </w:body>
</document>
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
<document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <w:body>
    <w:p>
      <w:r>
        <w:br type="page"/>
      </w:r>
    </w:p>
  </w:body>
</document>
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
<document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <w:body>
    <w:p>
      <w:pPr>
        <w:pStyle val="BodyText"/>
        <w:jc val="left"/>
      </w:pPr>
      <w:r>
        <w:rPr/>
        <w:t>This is a very small paragraph</w:t>
      </w:r>
    </w:p>
  </w:body>
</document>
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
<document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <w:body>
    <w:p>
      <w:pPr>
        <w:pStyle val="BodyText"/>
        <w:jc val="left"/>
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
          <w:u val="single"/>
        </w:rPr>
        <w:t>paragraph</w:t>
      </w:r>
    </w:p>
  </w:body>
</document>
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
<document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <w:body>
    <w:p>
      <w:pPr>
        <w:pStyle val="ListBullet"/>
        <w:jc val="left"/>
      </w:pPr>
      <w:r>
        <w:rPr/>
        <w:t>Bob</w:t>
      </w:r>
    </w:p>
    <w:p>
      <w:pPr>
        <w:pStyle val="ListBullet"/>
        <w:jc val="left"/>
      </w:pPr>
      <w:r>
        <w:rPr/>
        <w:t>Luke</w:t>
      </w:r>
    </w:p>
    <w:p>
      <w:pPr>
        <w:pStyle val="ListBullet"/>
        <w:jc val="left"/>
      </w:pPr>
      <w:r>
        <w:rPr/>
        <w:t>Jesse</w:t>
      </w:r>
    </w:p>
    <w:p>
      <w:pPr>
        <w:pStyle val="ListBullet"/>
        <w:jc val="left"/>
      </w:pPr>
      <w:r>
        <w:rPr/>
        <w:t>And the rest</w:t>
      </w:r>
    </w:p>
  </w:body>
</document>
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
    expected = <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <w:body>
    <w:tbl>
      <w:tblPr>
        <w:tblStyle val=""/>
        <w:tblW w="100" type="pct"/>
        <w:look val="0400"/>
      </w:tblPr>
      <w:tblGrid>
        <w:gridCol w="50"/>
        <w:gridCol w="50"/>
      </w:tblGrid>
      <w:tr>
        <w:tc>
          <w:tcPr>
            <w:tcW w="0" type="auto"/>
          </w:tcPr>
          <w:p>
            <w:pPr>
              <w:pStyle val="BodyText"/>
              <w:jc val="left"/>
            </w:pPr>
            <w:r>
              <w:rPr/>
              <w:t>Luke</w:t>
            </w:r>
          </w:p>
        </w:tc>
        <w:tc>
          <w:tcPr>
            <w:tcW w="0" type="auto"/>
          </w:tcPr>
          <w:p>
            <w:pPr>
              <w:pStyle val="BodyText"/>
              <w:jc val="left"/>
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
            <w:tcW w="0" type="auto"/>
          </w:tcPr>
          <w:p>
            <w:pPr>
              <w:pStyle val="BodyText"/>
              <w:jc val="left"/>
            </w:pPr>
            <w:r>
              <w:rPr/>
              <w:t>Gene</w:t>
            </w:r>
          </w:p>
        </w:tc>
        <w:tc>
          <w:tcPr>
            <w:tcW w="0" type="auto"/>
          </w:tcPr>
          <w:p>
            <w:pPr>
              <w:pStyle val="BodyText"/>
              <w:jc val="left"/>
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
            <w:tcW w="0" type="auto"/>
          </w:tcPr>
          <w:p>
            <w:pPr>
              <w:pStyle val="BodyText"/>
              <w:jc val="left"/>
            </w:pPr>
            <w:r>
              <w:rPr/>
              <w:t>Jesse</w:t>
            </w:r>
          </w:p>
        </w:tc>
        <w:tc>
          <w:tcPr>
            <w:tcW w="0" type="auto"/>
          </w:tcPr>
          <w:p>
            <w:pPr>
              <w:pStyle val="BodyText"/>
              <w:jc val="left"/>
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
            <w:tcW w="0" type="auto"/>
          </w:tcPr>
          <w:p>
            <w:pPr>
              <w:pStyle val="BodyText"/>
              <w:jc val="left"/>
            </w:pPr>
            <w:r>
              <w:rPr/>
              <w:t>Bob</w:t>
            </w:r>
          </w:p>
        </w:tc>
        <w:tc>
          <w:tcPr>
            <w:tcW w="0" type="auto"/>
          </w:tcPr>
          <w:p>
            <w:pPr>
              <w:pStyle val="BodyText"/>
              <w:jc val="left"/>
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
</document>
    XML
    document.document.to_xml
    assert_equal expected, document.document.to_s
  end
end
