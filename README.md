# Rocx

Rocx is a gem for creating .docx (Microsoft Word 2007) files. Using a simple API, you can create Word documents with:

  - Paragraphs
  - Titles
  - Headings
  - Page breaks
  - Bullet points
  - Tables
  
And, coming soon, images and more.

## Installation

Add to your Rails application in the Gemfile:

    gem 'rocx'
    
And then run:

    bundle install
    
Or install it yourself:

    gem install rocx

## Examples

    document = Rocx::Document.new do
      title "TPS Report Cover Sheet"
      table [
        ["Prepared by", ""]
        ["Date", ""]
        ["Product Code", ""]
        ["Customer", ""]
        ["Vendor", ""]
      ]
      page_break
      heading "Comments"
      paragraph [["Comments", "b"], "should be", ["descriptive:", "u"]]
      bullet "And if you could have this in by Friday, that would be great."
    end
    
    document.save("/path/where/it/should/be/saved.docx")
    
## History

### 0.1.0

 - Initial release
 - Support for:
   - Paragraphs
   - Titles
   - Headings
   - Page breaks
   - Bullet points
   - Tables
   
## Contribute!

  1. Fork it
  2. Create your feature branch (`git checkout -b my-new-feature`)
  3. Commit your changes (`git commit -am 'Add some feature`)
  4. Push to the branch (`git push origin my-new-feature`)
  5. Create new Pull Request