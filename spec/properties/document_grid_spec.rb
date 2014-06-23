require "spec_helper"

describe Rocx::Properties::DocumentGrid do
  include PropertyTestMacros

  it_should_use tag: :docGrid, name: "document_grid"

  for_attribute(:char_space) do
    with_value(40960) do
      it_should_assign_successfully
      it_should_output "<w:docGrid w:charSpace=\"40960\"/>"
    end

    with_value(:twelve) do
      it_should_raise_an_exception
    end

    with_value(-12345) do
      it_should_assign_successfully
      it_should_output "<w:docGrid w:charSpace=\"-12345\"/>"
    end

    with_value(123.45) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:line_pitch) do
    with_value(40960) do
      it_should_assign_successfully
      it_should_output "<w:docGrid w:linePitch=\"40960\"/>"
    end

    with_value(:twelve) do
      it_should_raise_an_exception
    end

    with_value(-12345) do
      it_should_assign_successfully
      it_should_output "<w:docGrid w:linePitch=\"-12345\"/>"
    end

    with_value(123.45) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:type) do
    with_value(:default) do
      it_should_assign_successfully
      it_should_output "<w:docGrid w:type=\"default\"/>"
    end

    with_value(:lines) do
      it_should_assign_successfully
      it_should_output "<w:docGrid w:type=\"lines\"/>"
    end

    with_value(:linesAndChars) do
      it_should_assign_successfully
      it_should_output "<w:docGrid w:type=\"linesAndChars\"/>"
    end

    with_value(:snapToChars) do
      it_should_assign_successfully
      it_should_output "<w:docGrid w:type=\"snapToChars\"/>"
    end
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(char_space: 40960, line_pitch: 40960, type: :default) do
    it_should_output "<w:docGrid w:charSpace=\"40960\" w:linePitch=\"40960\" w:type=\"default\"/>", assign: false
  end

end
