require "spec_helper"

describe Rocx::Elements::Run do
  include ElementTestMacros

  context "after creation" do
    before(:each) do
      @instance = described_class.new
      instance.italics = true
    end

    it_should_output_correct_xml
  end

end
