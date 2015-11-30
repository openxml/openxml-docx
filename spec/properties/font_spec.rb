require "spec_helper"

describe OpenXml::Docx::Properties::Font do
  include PropertyTestMacros

  it_should_use tag: :rFonts, name: "font"

  for_attribute(:ascii) do
    with_value("Courier New") do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:ascii=\"Courier New\"/>"
    end

    with_value(1) do
      it_should_raise_an_exception
    end

    with_value(:monospace) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:ascii_theme) do
    with_value(:majorAscii) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:asciiTheme=\"majorAscii\"/>"
    end

    with_value(:majorBidi) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:asciiTheme=\"majorBidi\"/>"
    end

    with_value(:majorEastAsia) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:asciiTheme=\"majorEastAsia\"/>"
    end

    with_value(:majorHAnsi) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:asciiTheme=\"majorHAnsi\"/>"
    end

    with_value(:minorAscii) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:asciiTheme=\"minorAscii\"/>"
    end

    with_value(:minorBidi) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:asciiTheme=\"minorBidi\"/>"
    end

    with_value(:minorEastAsia) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:asciiTheme=\"minorEastAsia\"/>"
    end

    with_value(:minorHAnsi) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:asciiTheme=\"minorHAnsi\"/>"
    end

    with_value(:latin) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:complex) do
    with_value("Courier New") do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:cs=\"Courier New\"/>"
    end

    with_value(1) do
      it_should_raise_an_exception
    end

    with_value(:monospace) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:complex_theme) do
    with_value(:majorAscii) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:cstheme=\"majorAscii\"/>"
    end

    with_value(:majorBidi) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:cstheme=\"majorBidi\"/>"
    end

    with_value(:majorEastAsia) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:cstheme=\"majorEastAsia\"/>"
    end

    with_value(:majorHAnsi) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:cstheme=\"majorHAnsi\"/>"
    end

    with_value(:minorAscii) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:cstheme=\"minorAscii\"/>"
    end

    with_value(:minorBidi) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:cstheme=\"minorBidi\"/>"
    end

    with_value(:minorEastAsia) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:cstheme=\"minorEastAsia\"/>"
    end

    with_value(:minorHAnsi) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:cstheme=\"minorHAnsi\"/>"
    end

    with_value(:latin) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:east_asia) do
    with_value("Courier New") do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:eastAsia=\"Courier New\"/>"
    end

    with_value(1) do
      it_should_raise_an_exception
    end

    with_value(:monospace) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:east_asia_theme) do
    with_value(:majorAscii) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:eastAsiaTheme=\"majorAscii\"/>"
    end

    with_value(:majorBidi) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:eastAsiaTheme=\"majorBidi\"/>"
    end

    with_value(:majorEastAsia) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:eastAsiaTheme=\"majorEastAsia\"/>"
    end

    with_value(:majorHAnsi) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:eastAsiaTheme=\"majorHAnsi\"/>"
    end

    with_value(:minorAscii) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:eastAsiaTheme=\"minorAscii\"/>"
    end

    with_value(:minorBidi) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:eastAsiaTheme=\"minorBidi\"/>"
    end

    with_value(:minorEastAsia) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:eastAsiaTheme=\"minorEastAsia\"/>"
    end

    with_value(:minorHAnsi) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:eastAsiaTheme=\"minorHAnsi\"/>"
    end

    with_value(:latin) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:high_ansi) do
    with_value("Courier New") do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:hAnsi=\"Courier New\"/>"
    end

    with_value(1) do
      it_should_raise_an_exception
    end

    with_value(:monospace) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:high_ansi_theme) do
    with_value(:majorAscii) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:hAnsiTheme=\"majorAscii\"/>"
    end

    with_value(:majorBidi) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:hAnsiTheme=\"majorBidi\"/>"
    end

    with_value(:majorEastAsia) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:hAnsiTheme=\"majorEastAsia\"/>"
    end

    with_value(:majorHAnsi) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:hAnsiTheme=\"majorHAnsi\"/>"
    end

    with_value(:minorAscii) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:hAnsiTheme=\"minorAscii\"/>"
    end

    with_value(:minorBidi) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:hAnsiTheme=\"minorBidi\"/>"
    end

    with_value(:minorEastAsia) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:hAnsiTheme=\"minorEastAsia\"/>"
    end

    with_value(:minorHAnsi) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:hAnsiTheme=\"minorHAnsi\"/>"
    end

    with_value(:latin) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:hint) do
    with_value(:cs) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:hint=\"cs\"/>"
    end

    with_value(:default) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:hint=\"default\"/>"
    end

    with_value(:eastAsia) do
      it_should_assign_successfully
      it_should_output "<w:rFonts w:hint=\"eastAsia\"/>"
    end

    with_value(:ascii) do
      it_should_raise_an_exception
    end
  end

end
