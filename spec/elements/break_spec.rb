require "spec_helper"

describe OpenXml::Docx::Elements::Break do
  include ElementTestMacros

  it_should_use tag: :br, name: "break"

  for_attribute(:clear) do
    %i(all left none right).each do |allowed_value|
      with_value(allowed_value) do
        it_should_assign_successfully
        it_should_output "<w:br w:clear=\"#{allowed_value}\"/>"
      end
    end

    with_value(:somethingElse) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:type) do
    %i(column page textWrapping).each do |allowed_value|
      with_value(allowed_value) do
        it_should_assign_successfully
        it_should_output "<w:br w:type=\"#{allowed_value}\"/>"
      end
    end

    with_value(:somethingElse) do
      it_should_raise_an_exception
    end
  end

end
