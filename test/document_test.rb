require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  
  test "calling save on a document should create the word file" do
    document = Rocx::Document.new do
      body do
        paragraph "It works!"
      end
    end
    document.save('/Users/doyelme/Desktop/test.docx')
  end
  
end