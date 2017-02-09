# OpenXml::Docx

[![Gem Version](https://badge.fury.io/rb/openxml-docx.svg)](https://rubygems.org/gems/openxml-docx)
[![Code Climate](https://codeclimate.com/github/openxml/openxml-docx.svg)](https://codeclimate.com/github/openxml/openxml-docx)
[![Build Status](https://travis-ci.org/openxml/openxml-docx.svg)](https://travis-ci.org/openxml/openxml-docx)

OpenXml::Docx is a gem for creating .docx (Office Open XML) files. It's designed to validate _before_ the document is generated, so (hopefully) any errors are caught prior to opening the file using software that can handle OOXML (like Microsoft Word, Apache Open Office, Google Docs, etc).

An example:

```ruby
require "openxml/docx"

text = OpenXml::Docx::Elements::Text.new("Some text that I want to include in my new OOXML document")
run = OpenXml::Docx::Elements::Run.new
run.bold = true
run << text
paragraph = OpenXml::Docx::Elements::Paragraph.new
paragraph << run

document = OpenXml::Docx::Package.new
document.document << paragraph
document.save("/path/where/i/save/things/test.docx")
```


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'openxml-docx'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install openxml-docx


## Current features

  - Paragraphs
  - Runs and text
  - Formatting and styles for the paragraphs, runs, and text


## Roadmap

It's important to note that lists goes off into the future quite a bit, therefore it's very likely that it will change. That being said, this is the plan for future releases:

  - 0.7.0: Sections
  - 0.8.0: Increased support for styles and fonts
  - 0.9.0: Images and movies
  - 0.10.0: Numbering and lists
  - 0.11.0: Headers and footers
  - 0.12.0: Footnotes and endnotes
  - 0.13.0: Glossary documents
  - 0.14.0: Annotations
  - 0.15.0: Increased support for document-level settings
  - 0.16.0: Tables
  - 0.17.0: Embedded custom markup
  - 0.18.0: Fields and hyperlinks
  - 0.19.0: Mail merge
  - 0.20.0: Layer on a DSL for making the whole thing smoother



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

Reference for WordprocessingML can be found in Part 1 of the Fourth Edition of [ECMA-376](http://www.ecma-international.org/publications/standards/Ecma-376.htm) (the Office Open XML Standard).

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/openxml/openxml-docx.


## Changelog

  - 0.6.0: Added additional run content
  - 0.5.8: Added run properties
  - 0.5.7: Added paragraph properties
  - 0.5.0: First version with document content (i.e. paragraphs)
  - 0.4.0: Rudimentary support for styles
  - 0.3.0: First version supporting outputting in target format
