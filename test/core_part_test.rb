require 'test_helper'

class CorePartTest < ActiveSupport::TestCase
  
  test "meta_data with no options should create the core XML with no properties" do
    document = Rocx::Document.new do
      meta_data
    end
    document.core.to_xml
    expected = <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<coreProperties xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:dcmitype="http://purl.org/dc/dcmitype/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <dc:title/>
  <dc:subject/>
  <dc:creator/>
  <cp:keywords/>
  <cp:lastModifiedBy/>
  <cp:revision>1</cp:revision>
  <cp:category/>
  <dc:description/>
  <dcterms:created xsi:type="dcterms:W3CDTF">#{Time.new.strftime('%Y-%m-%dT%H:%M:%SZ')}</dcterms:created>
  <dcterms:modified xsi:type="dcterms:W3CDTF">#{Time.new.strftime('%Y-%m-%dT%H:%M:%SZ')}</dcterms:modified>
</coreProperties>
    XML
    assert expected, document.core.to_s
  end
  
  test "meta_data with creator set but not last_modified_by should have the creator as the last_modified_by" do
    document = Rocx::Document.new do
      meta_data creator: "Gene Doyel"
    end
    document.core.to_xml
    expected = <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<coreProperties xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:dcmitype="http://purl.org/dc/dcmitype/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <dc:title/>
  <dc:subject/>
  <dc:creator>Gene Doyel</dc:creator>
  <cp:keywords/>
  <cp:lastModifiedBy>Gene Doyel</cp:lastModifiedBy>
  <cp:revision>1</cp:revision>
  <cp:category/>
  <dc:description/>
  <dcterms:created xsi:type="dcterms:W3CDTF">#{Time.new.strftime('%Y-%m-%dT%H:%M:%SZ')}</dcterms:created>
  <dcterms:modified xsi:type="dcterms:W3CDTF">#{Time.new.strftime('%Y-%m-%dT%H:%M:%SZ')}</dcterms:modified>
</coreProperties>
    XML
    assert_equal expected, document.core.to_s
  end
  
  test "meta_data with creator and last_modified_by set should have two different values for those nodes" do
    document = Rocx::Document.new do
      meta_data creator: "Gene Doyel", last_modified_by: "Bob Lail"
    end
    document.core.to_xml
    expected = <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<coreProperties xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:dcmitype="http://purl.org/dc/dcmitype/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <dc:title/>
  <dc:subject/>
  <dc:creator>Gene Doyel</dc:creator>
  <cp:keywords/>
  <cp:lastModifiedBy>Bob Lail</cp:lastModifiedBy>
  <cp:revision>1</cp:revision>
  <cp:category/>
  <dc:description/>
  <dcterms:created xsi:type="dcterms:W3CDTF">#{Time.new.strftime('%Y-%m-%dT%H:%M:%SZ')}</dcterms:created>
  <dcterms:modified xsi:type="dcterms:W3CDTF">#{Time.new.strftime('%Y-%m-%dT%H:%M:%SZ')}</dcterms:modified>
</coreProperties>
    XML
    assert_equal expected, document.core.to_s  
  end
  
end
