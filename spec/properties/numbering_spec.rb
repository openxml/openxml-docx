require "spec_helper"

describe Rocx::Properties::Numbering do
  include PropertyTestMacros

  it_should_use tag: :numPr, name: "numbering"

  for_attribute(:level) do
    with_value(24) do
      it_should_assign_successfully
      it_should_output "<w:numPr>\n    <w:ilvl w:val=\"24\"/>\n  </w:numPr>"
    end

    with_value(-24) do
      it_should_raise_an_exception
    end

    with_value(:big) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:id) do
    with_value(24) do
      it_should_assign_successfully
      it_should_output "<w:numPr>\n    <w:numId w:val=\"24\"/>\n  </w:numPr>"
    end

    with_value(-24) do
      it_should_raise_an_exception
    end

    with_value(:big) do
      it_should_raise_an_exception
    end
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(level: 4, id: 0) do
    it_should_output "<w:numPr>\n    <w:ilvl w:val=\"4\"/>\n    <w:numId w:val=\"0\"/>\n  </w:numPr>", assign: false
  end

end
