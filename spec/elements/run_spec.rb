require "spec_helper"

describe Rocx::Elements::Run do
  include ElementTestMacros

  context "after creation" do
    before(:each) do
      @node = described_class.new
      node.italics = true
    end

    it_should_output_correct_xml
  end

end
