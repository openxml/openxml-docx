require "spec_helper"

describe OpenXml::DrawingML::Elements::Extension do
  include ElementTestMacros

  it_should_use tag: :ext, name: "extension"

  for_attribute(:uri) do
    with_value("http://schemas.microsoft.com/office/word/2010/wordprocessingShape") do
      it_should_assign_successfully
      it_should_output "<a:ext uri=\"http://schemas.microsoft.com/office/word/2010/wordprocessingShape\"/>"
    end

    with_value(:not_a_string) do
      it_should_raise_an_exception
    end
  end

end
