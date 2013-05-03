require 'spec_helper'

describe Rocx::XmlElements::Table do
  it "should create a table in the document" do
    table_xml = element_xml('table')
    
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
    expect(document.document.to_s).to eq(table_xml)
  end
end

#   
#   test "tables passes with borders enables should use borders" do
#     document = Rocx::Document.new do
#       body do
#         heading "Hey bordered table"
#         table [
#           ["I", "Have", "Borders"]
#         ], borders: "yeah", border_type: 'wave', border_color: "#dfdfdf"
#       end
#     end
#     document.document.to_xml
#     expected = <<-XML
# <?xml version="1.0" encoding="UTF-8"?>
# <w:document xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mo="http://schemas.microsoft.com/office/mac/office/2008/main" xmlns:mv="urn:schemas-microsoft-com:mac:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" mc:Ignorable="w14 wp14">
#   <w:body>
#     <w:p>
#       <w:pPr>
#         <w:pStyle w:val="Heading1"/>
#       </w:pPr>
#       <w:r>
#         <w:t>Hey bordered table</w:t>
#       </w:r>
#     </w:p>
#     <w:tbl>
#       <w:tblPr>
#         <w:tblStyle w:val=""/>
#         <w:tblW w:w="100" w:type="pct"/>
#         <w:tblBorders>
#           <w:top w:color="#dfdfdf" w:space="0" w:sz="4" w:val="wave"/>
#           <w:left w:color="#dfdfdf" w:space="0" w:sz="4" w:val="wave"/>
#           <w:bottom w:color="#dfdfdf" w:space="0" w:sz="4" w:val="wave"/>
#           <w:right w:color="#dfdfdf" w:space="0" w:sz="4" w:val="wave"/>
#           <w:insideH w:color="#dfdfdf" w:space="0" w:sz="4" w:val="wave"/>
#           <w:insideV w:color="#dfdfdf" w:space="0" w:sz="4" w:val="wave"/>
#         </w:tblBorders>
#         <w:look w:val="0400"/>
#       </w:tblPr>
#       <w:tblGrid>
#         <w:gridCol w:w="33"/>
#         <w:gridCol w:w="33"/>
#         <w:gridCol w:w="33"/>
#       </w:tblGrid>
#       <w:tr>
#         <w:tc>
#           <w:tcPr>
#             <w:tcW w:w="0" w:type="auto"/>
#             <w:shd w:val="clear" w:color="auto" w:fill="FFFFFF" w:themeFill="text2" w:themeFillTint="99"/>
#           </w:tcPr>
#           <w:p>
#             <w:pPr>
#               <w:pStyle w:val="BodyText"/>
#               <w:jc w:val="left"/>
#             </w:pPr>
#             <w:r>
#               <w:rPr/>
#               <w:t>I</w:t>
#             </w:r>
#           </w:p>
#         </w:tc>
#         <w:tc>
#           <w:tcPr>
#             <w:tcW w:w="0" w:type="auto"/>
#             <w:shd w:val="clear" w:color="auto" w:fill="FFFFFF" w:themeFill="text2" w:themeFillTint="99"/>
#           </w:tcPr>
#           <w:p>
#             <w:pPr>
#               <w:pStyle w:val="BodyText"/>
#               <w:jc w:val="left"/>
#             </w:pPr>
#             <w:r>
#               <w:rPr/>
#               <w:t>Have</w:t>
#             </w:r>
#           </w:p>
#         </w:tc>
#         <w:tc>
#           <w:tcPr>
#             <w:tcW w:w="0" w:type="auto"/>
#             <w:shd w:val="clear" w:color="auto" w:fill="FFFFFF" w:themeFill="text2" w:themeFillTint="99"/>
#           </w:tcPr>
#           <w:p>
#             <w:pPr>
#               <w:pStyle w:val="BodyText"/>
#               <w:jc w:val="left"/>
#             </w:pPr>
#             <w:r>
#               <w:rPr/>
#               <w:t>Borders</w:t>
#             </w:r>
#           </w:p>
#         </w:tc>
#       </w:tr>
#     </w:tbl>
#   </w:body>
# </w:document>
#     XML
#     assert_equal expected, document.document.to_s
#   end
#   
# end