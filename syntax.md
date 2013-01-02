
document = Rocx::Document.new do
  
  heading "Welcome to Gene's docx module!", 1
  
  heading "Make and edit docx in Ruby!", 2
  
  paragraph "This module was created when I was looking for Ruby support for Docx files! And there weren't any good options!"
  paragraph "Now a list of cool developers in EP:"
  
  developers = ['Bob', 'Gene', 'Jesse', 'and the rest']
  developers.each { |dev| bullet dev }
  
  paragraph "Sorry Luke."
  
  heading "Making documents", 2
  
  paragraph "Rocx has the following modules QUAKE IN FEAR OF THEIR MIGHTY POWER:"
  features = [
    'Paragraphs',
    'Bullets',
    'Numbered lists',
    'Multiple levels of headings',
    'Tables',
    'Document Properties'
  ]
  
  features.each { |feature| bullet feature }
  
  table do
    "A1", "A2", "A3"
    "B1", "B2", "B3"
    "C1", "C2", "C3"
  end
  
end