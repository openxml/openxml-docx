require "spec_helper"

describe OpenXml::Docx::Properties::PageNumbering do
  include PropertyTestMacros

  it_should_use tag: :pgNumType, name: "page_numbering"

  for_attribute(:chapter_separator) do
    values = %i(colon emDash enDash hyphen period)
    it_should_assign_and_output_xml values
  end

  for_attribute(:chapter_style) do
    values = [1, -10]
    it_should_assign_and_output_xml values
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  for_attribute(:format) do
    values = %i(aiueo aiueoFullWidth arabicAbjad arabicAlpha bahtText
                bullet cardinalText chicago chineseCounting chineseCountingThousand
                chineseLegalSimplified chosung custom decimal decimalEnclosedCircle
                decimalEnclosedCircleChinese decimalEnclosedFullstop decimalEnclosedParen
                decimalFullWidth decimalHalfWidth decimalZero dollarText ganada
                hebrew1 hebrew2 hex hindiConsonants hindiNumbers hindiVowels
                ideographDigital ideographEnclosedCircle ideographLegalTraditional
                ideographTraditional ideographZodiac ideographZodiacTraditional
                iroha irohaFullWidth japaneseCounting japaneseDigitalTenThousand
                japaneseLegal koreanCounting koreanDigital koreanDigital2
                koreanLegal lowerLetter lowerRoman none numberInDash ordinal
                ordinalText russianLower russianUpper taiwaneseCounting
                taiwaneseCountingThousand taiwaneseDigital thaiCounting thaiLetters
                thaiNumbers upperLetter upperRoman vietnameseCounting)
    it_should_assign_and_output_xml values
    it_should_not_allow_invalid_value
  end

  for_attribute(:start) do
    values = [1, -10]
    it_should_assign_and_output_xml values
    it_should_not_allow_floats
    it_should_not_allow_invalid_value
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(chapter_separator: :colon, chapter_style: 1, format: :taiwaneseCountingThousand, start: 2) do
    it_should_output "<w:pgNumType w:chapSep=\"colon\" w:chapStyle=\"1\" w:fmt=\"taiwaneseCountingThousand\" w:start=\"2\"/>", assign: false
  end

end
