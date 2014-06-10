require "spec_helper"

describe Rocx::Properties::CompressPunctuation do
  include ValuePropertyTestMacros

  it_should_use tag: :topLinePunct, name: "compress_punctuation"

  with_value(:on) do
    it_should_work
    it_should_output "<w:topLinePunct w:val=\"on\"/>"
  end

  with_value(:off) do
    it_should_work
    it_should_output "<w:topLinePunct w:val=\"off\"/>"
  end

  with_value(nil) do
    it_should_work
    it_should_output ""
  end

end
