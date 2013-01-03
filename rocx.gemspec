# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rocx/version'

Gem::Specification.new do |gem|
  gem.name          = "rocx"
  gem.version       = Rocx::VERSION
  gem.authors       = ["Gene Doyel"]
  gem.email         = ["gene.doyel@cph.org"]
  gem.description   = %q{Create Microsoft Word (.docx) files.}
  gem.summary       = %q{Using a simple API, create docx files programmatically, including bullet points, titles, headings, page breaks and tables!}
  gem.homepage      = "https://github.com/southcitygene/rocx"
  
  gem.add_dependency "libxml-ruby"
  gem.add_dependency "rubyzip"
  gem.add_dependency "activesupport"
  
  gem.add_development_dependency "rails", "~> 3.2.8"
  gem.add_development_dependency "turn"
  gem.add_development_dependency "pry"
  
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
