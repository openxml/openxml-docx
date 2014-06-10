require "spec_helper"

describe Rocx::Parts::GlobalRels do
  include PartTestMacros

  context "always" do
    before(:each) do
      @doc = described_class.new
    end

    it_should_output_correct_xml
  end
end
