require "spec_helper"

describe Rocx::Properties::PageNumbering do
  include PropertyTestMacros

  it_should_use tag: :pgNumType, name: "page_numbering"

  for_attribute(:chapter_separator) do
    with_value(:colon) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:chapSep=\"colon\"/>"
    end

    with_value(:emDash) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:chapSep=\"emDash\"/>"
    end

    with_value(:enDash) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:chapSep=\"enDash\"/>"
    end

    with_value(:hyphen) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:chapSep=\"hyphen\"/>"
    end

    with_value(:period) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:chapSep=\"period\"/>"
    end
  end

  for_attribute(:chapter_style) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:chapStyle=\"1\"/>"
    end

    with_value(-10) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:chapStyle=\"-10\"/>"
    end

    with_value(122.2) do
      it_should_raise_an_exception
    end

    with_value(:cool) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:format) do
    with_value(:aiueo) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"aiueo\"/>"
    end

    with_value(:aiueoFullWidth) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"aiueoFullWidth\"/>"
    end

    with_value(:arabicAbjad) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"arabicAbjad\"/>"
    end

    with_value(:arabicAlpha) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"arabicAlpha\"/>"
    end

    with_value(:bahtText) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"bahtText\"/>"
    end

    with_value(:bullet) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"bullet\"/>"
    end

    with_value(:cardinalText) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"cardinalText\"/>"
    end

    with_value(:chicago) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"chicago\"/>"
    end

    with_value(:chineseCounting) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"chineseCounting\"/>"
    end

    with_value(:chineseCountingThousand) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"chineseCountingThousand\"/>"
    end

    with_value(:chineseLegalSimplified) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"chineseLegalSimplified\"/>"
    end

    with_value(:chosung) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"chosung\"/>"
    end

    with_value(:custom) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"custom\"/>"
    end

    with_value(:decimal) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"decimal\"/>"
    end

    with_value(:decimalEnclosedCircle) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"decimalEnclosedCircle\"/>"
    end

    with_value(:decimalEnclosedCircleChinese) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"decimalEnclosedCircleChinese\"/>"
    end

    with_value(:decimalEnclosedFullstop) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"decimalEnclosedFullstop\"/>"
    end

    with_value(:decimalEnclosedParen) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"decimalEnclosedParen\"/>"
    end

    with_value(:decimalFullWidth) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"decimalFullWidth\"/>"
    end

    with_value(:decimalHalfWidth) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"decimalHalfWidth\"/>"
    end

    with_value(:decimalZero) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"decimalZero\"/>"
    end

    with_value(:dollarText) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"dollarText\"/>"
    end

    with_value(:ganada) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"ganada\"/>"
    end

    with_value(:hebrew1) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"hebrew1\"/>"
    end

    with_value(:hebrew2) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"hebrew2\"/>"
    end

    with_value(:hex) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"hex\"/>"
    end

    with_value(:hindiConsonants) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"hindiConsonants\"/>"
    end

    with_value(:hindiCounting) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"hindiCounting\"/>"
    end

    with_value(:hindiNumbers) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"hindiNumbers\"/>"
    end

    with_value(:hindiVowels) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"hindiVowels\"/>"
    end

    with_value(:ideographDigital) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"ideographDigital\"/>"
    end

    with_value(:ideographEnclosedCircle) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"ideographEnclosedCircle\"/>"
    end

    with_value(:ideographLegalTraditional) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"ideographLegalTraditional\"/>"
    end

    with_value(:ideographTraditional) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"ideographTraditional\"/>"
    end

    with_value(:ideographZodiac) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"ideographZodiac\"/>"
    end

    with_value(:ideographZodiacTraditional) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"ideographZodiacTraditional\"/>"
    end

    with_value(:iroha) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"iroha\"/>"
    end

    with_value(:irohaFullWidth) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"irohaFullWidth\"/>"
    end

    with_value(:japaneseCounting) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"japaneseCounting\"/>"
    end

    with_value(:japaneseDigitalTenThousand) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"japaneseDigitalTenThousand\"/>"
    end

    with_value(:japaneseLegal) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"japaneseLegal\"/>"
    end

    with_value(:koreanCounting) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"koreanCounting\"/>"
    end

    with_value(:koreanDigital) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"koreanDigital\"/>"
    end

    with_value(:koreanDigital2) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"koreanDigital2\"/>"
    end

    with_value(:koreanLegal) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"koreanLegal\"/>"
    end

    with_value(:lowerLetter) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"lowerLetter\"/>"
    end

    with_value(:lowerRoman) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"lowerRoman\"/>"
    end

    with_value(:none) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"none\"/>"
    end

    with_value(:numberInDash) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"numberInDash\"/>"
    end

    with_value(:ordinal) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"ordinal\"/>"
    end

    with_value(:ordinalText) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"ordinalText\"/>"
    end

    with_value(:russianLower) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"russianLower\"/>"
    end

    with_value(:russianUpper) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"russianUpper\"/>"
    end

    with_value(:taiwaneseCounting) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"taiwaneseCounting\"/>"
    end

    with_value(:taiwaneseCountingThousand) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"taiwaneseCountingThousand\"/>"
    end

    with_value(:taiwaneseDigital) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"taiwaneseDigital\"/>"
    end

    with_value(:thaiCounting) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"thaiCounting\"/>"
    end

    with_value(:thaiLetters) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"thaiLetters\"/>"
    end

    with_value(:thaiNumbers) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"thaiNumbers\"/>"
    end

    with_value(:upperLetter) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"upperLetter\"/>"
    end

    with_value(:upperRoman) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"upperRoman\"/>"
    end

    with_value(:vietnameseCounting) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:fmt=\"vietnameseCounting\"/>"
    end
  end

  for_attribute(:start) do
    with_value(1) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:start=\"1\"/>"
    end

    with_value(-10) do
      it_should_assign_successfully
      it_should_output "<w:pgNumType w:start=\"-10\"/>"
    end

    with_value(122.2) do
      it_should_raise_an_exception
    end

    with_value(:cool) do
      it_should_raise_an_exception
    end
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(chapter_separator: :colon, chapter_style: 1, format: :taiwaneseCountingThousand, start: 2) do
    it_should_output "<w:pgNumType w:chapSep=\"colon\" w:chapStyle=\"1\" w:fmt=\"taiwaneseCountingThousand\" w:start=\"2\"/>", assign: false
  end

end
