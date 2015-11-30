# -*- encoding: utf-8 -*-
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "openxml/docx/version"

Gem::Specification.new do |gem|
  gem.name          = "openxml-docx"
  gem.version       = OpenXml::Docx::VERSION
  gem.authors       = ["Gene Doyel"]
  gem.email         = ["genedoyel@gmail.com"]

  gem.description   = %q{Create Microsoft Word (.docx) files.}
  gem.summary       = %q{Using a simple API, create docx files programmatically, including bullet points, titles, headings, page breaks and tables!}
  gem.license       = "MIT"
  gem.homepage      = "https://github.com/openxml/openxml-docx"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = Dir.glob("test/**/*_test.rb")
  gem.require_paths = ["lib"]

  gem.required_ruby_version = "~> 2.0"

  gem.add_dependency "nokogiri"
  gem.add_dependency "openxml-package", ">= 0.2.1"

  gem.add_development_dependency "pry"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rr"
  gem.add_development_dependency "simplecov"
  gem.add_development_dependency "timecop"
end
