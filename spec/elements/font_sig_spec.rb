require "spec_helper"

describe OpenXml::Docx::Elements::FontSig do
  include ElementTestMacros

  it_should_use tag: :sig, name: "font_sig"

  for_attribute(:csb0) do
    with_value("F0E1B2E3") do
      it_should_assign_successfully
      it_should_output "<w:sig w:csb0=\"F0E1B2E3\"/>"
    end

    with_values(["FF","Not Hex","FFFFFFFFFF"]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:csb1) do
    with_value("F0E1B2E3") do
      it_should_assign_successfully
      it_should_output "<w:sig w:csb1=\"F0E1B2E3\"/>"
    end

    with_values(["FF","Not Hex","FFFFFFFFFF"]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:usb0) do
    with_value("F0E1B2E3") do
      it_should_assign_successfully
      it_should_output "<w:sig w:usb0=\"F0E1B2E3\"/>"
    end

    with_values(["FF","Not Hex","FFFFFFFFFF"]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:usb1) do
    with_value("F0E1B2E3") do
      it_should_assign_successfully
      it_should_output "<w:sig w:usb1=\"F0E1B2E3\"/>"
    end

    with_values(["FF","Not Hex","FFFFFFFFFF"]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:usb2) do
    with_value("F0E1B2E3") do
      it_should_assign_successfully
      it_should_output "<w:sig w:usb2=\"F0E1B2E3\"/>"
    end

    with_values(["FF","Not Hex","FFFFFFFFFF"]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:usb3) do
    with_value("F0E1B2E3") do
      it_should_assign_successfully
      it_should_output "<w:sig w:usb3=\"F0E1B2E3\"/>"
    end

    with_values(["FF","Not Hex","FFFFFFFFFF"]) do
      it_should_raise_an_exception
    end
  end

end
