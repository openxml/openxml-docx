require "spec_helper"

describe OpenXml::Docx::Properties::Font do
  include PropertyTestMacros

  it_should_use tag: :rFonts, name: "font"

  for_attribute(:ascii) do
    it_should_assign_and_output_xml "Courier New"
    it_should_not_allow_integers
    it_should_not_allow_invalid_value
  end

  for_attribute(:ascii_theme) do
    values = %i(majorAscii majorBidi majorEastAsia majorHAnsi
                minorAscii minorBidi minorEastAsia minorHAnsi)
    it_should_assign_and_output_xml values
    it_should_not_allow_integers
    it_should_not_allow_invalid_value
  end

  for_attribute(:complex) do
    it_should_assign_and_output_xml "Courier New"
    it_should_not_allow_integers
    it_should_not_allow_invalid_value
  end

  for_attribute(:complex_theme) do
    values = %i(majorAscii majorBidi majorEastAsia majorHAnsi
                minorAscii minorBidi minorEastAsia minorHAnsi)
    it_should_assign_and_output_xml values
    it_should_not_allow_integers
    it_should_not_allow_invalid_value
  end

  for_attribute(:east_asia) do
    it_should_assign_and_output_xml "Courier New"
    it_should_not_allow_integers
    it_should_not_allow_invalid_value
  end

  for_attribute(:east_asia_theme) do
    values = %i(majorAscii majorBidi majorEastAsia majorHAnsi
                minorAscii minorBidi minorEastAsia minorHAnsi)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  for_attribute(:high_ansi) do
    it_should_assign_and_output_xml "Courier New"
    it_should_not_allow_integers
    it_should_not_allow_invalid_value
  end

  for_attribute(:high_ansi_theme) do
    values = %i(majorAscii majorBidi majorEastAsia majorHAnsi
                minorAscii minorBidi minorEastAsia minorHAnsi)
    it_should_assign_and_output_xml values
    it_should_not_allow_integers
    it_should_not_allow_invalid_value
  end

  for_attribute(:hint) do
    values = %i(cs default eastAsia)
    it_should_assign_and_output_xml values
    it_should_not_allow_integers
    it_should_not_allow_invalid_value
  end

end
