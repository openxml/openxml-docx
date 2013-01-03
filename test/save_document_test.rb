# require 'test_helper'
# 
# class SaveDocumentTest < ActiveSupport::TestCase
#   
#   test "calling save on a document should create the word file" do
#     document = Rocx::Document.new do
#       body do
#         title "Page Title"
#         paragraph "This is a test page created by Rocx"
#         
#         heading "Lets look at some bullets with varying levels"
#         bullet "Red", level: 0
#         bullet "Green", level: 0
#         bullet "Yellow", level: 1
#         bullet "Black", level: 2
#         bullet "Orange", level: 0
#         
#         paragraph "How about we start fresh on a new page?"
#         page_break
#         
#         heading "Names & Positions"
#         table [
#           ["Luke", "Programmer"],
#           ["Gene", "Programmer"],
#           ["Jesse", "Programmer"],
#           ["Bob", "Boss"]
#         ]
#         
#         paragraph "That's it so far!"
#       end
#     end
#     file_path = File.expand_path('~/Desktop/test.docx')
#     document.save(file_path)
#     assert File.file?(file_path)
#     `open #{file_path}`
#   end
#   
# end