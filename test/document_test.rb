require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  
  test "document to_s should print out the xml document" do
    document = Rocx::Document.new
    expected = <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <w:body/>
</document>
    XML
    assert_equal expected, document.to_s
  end
  
  test "a heading should create a heading element in the document" do
    document = Rocx::Document.new do
      heading "Luke & Gene > everyone else", 1
    end
    document.to_xml
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
    assert_equal expected, document.to_s
  end
  
  test "page_break should raise an error if given an invalid type" do
    assert_raises(ArgumentError) do
      document = Rocx::Document.new do
        page_break type: :banana
      end
    end
  end
  
  test "page_break should create a page break element in the document" do
    document = Rocx::Document.new do
      page_break
    end
    document.to_xml
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
    assert_equal expected, document.to_s
  end
  
  test "a paragraph with no special style should create a paragraph element in the document" do
    document = Rocx::Document.new do
      paragraph "This is a very small paragraph"
    end
    document.to_xml
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
    assert_equal expected, document.to_s
  end
  
  test "a paragraph with special style should create a paragraph element in the document" do
    document = Rocx::Document.new do
      paragraph ["This is a ", ["very", "ib"], " small ", ["paragraph", "u"]]
    end
    document.to_xml
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
    assert_equal expected, document.to_s
  end
  
  test "bullet should create a paragraph of ListBullet type" do
    document = Rocx::Document.new do
      bullet "Bob"
      bullet "Luke"
      bullet "Jesse"
      bullet "And the rest"
    end
    document.to_xml
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
    assert_equal expected, document.to_s
  end
  
end
