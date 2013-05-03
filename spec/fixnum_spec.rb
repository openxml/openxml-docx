require 'spec_helper'

describe Fixnum, "#to_emus" do
  it "should convert to English Metric Units" do
    expect(100.to_emus).to eq(1266700)
  end
end
