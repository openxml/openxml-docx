# Rocx [![Code Climate](https://codeclimate.com/github/genebot/rocx.png)](https://codeclimate.com/github/genebot/rocx)

Rocx is a gem for creating .docx (Office Open XML) files. It's designed to validate _before_ the document is generated, so (hopefully) any errors are caught prior to opening the file using software that can handle OOXML (like Microsoft Word, Apache Open Office, Google Docs, etc).

An example:

```ruby
require "rocx"

text = Rocx::Elements::Text.new("Some text that I want to include in my new OOXML document")
run = Rocx::Elements::Run.new
run.bold = true
run << text
paragraph = Rocx::Elements::Paragraph.new
paragraph << run

document = Rocx::Package.new
document.document << paragraph
document.save("/path/where/i/save/things/test.docx")
```

## Installation

You can install Rocx by running `gem install rocx`, or if you like Rails, include `gem "rocx"` in your Gemfile.

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

## Contribute!

Want to help? Thanks, friend! Here's how:

  1. Fork it
  2. Make your changes on a topic branch
  3. Create new a pull request
  4. Receive many thank-yous

## Changelog

  - 0.6.0: Added additional run content
  - 0.5.8: Added run properties
  - 0.5.7: Added paragraph properties
  - 0.5.0: First version with document content (i.e. paragraphs)
  - 0.4.0: Rudimentary support for styles
  - 0.3.0: First version supporting outputting in target format
