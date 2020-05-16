# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "openxml/docx/version"

Gem::Specification.new do |spec|
  spec.name          = "openxml-docx"
  spec.version       = OpenXml::Docx::VERSION
  spec.authors       = ["Gene Doyel", "Bob Lail"]
  spec.email         = ["genedoyel@gmail.com", "bob.lailfamily@gmail.com"]

  spec.description   = %q{Create Microsoft Word (.docx) files.}
  spec.summary       = %q{Implements the Office Open XML spec for creating WordprocessingML documents}
  spec.homepage      = "https://github.com/openxml/openxml-docx"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = "~> 2.0"

  spec.add_dependency "nokogiri"
  spec.add_dependency "openxml-package", ">= 0.2.2"
  spec.add_dependency "openxml-drawingml"
  spec.add_dependency "ox", "~> 2.9"

  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rr"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "timecop"
end
