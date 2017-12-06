module OpenXml
  module Docx
    module Properties
      class NumberFormat < ValueProperty
        tag :numFmt

        # TODO: Also allow "format" when "custom" is the number format

        def ok_values
          %i(decimal upperRoman lowerRoman upperLetter lowerLetter ordinal
            cardinalText ordinalText hex chicago ideographDigital japaneseCounting
            aiueo iroha decimalFullWidth decimalHalfWidth japaneseLegal
            japaneseDigitalTenThousand decimalEnclosedCircle decimalFullWidth2
            aiueoFullWidth irohaFullWidth decimalZero bullet ganada chosung
            decimalEnclosedFullstop
            decimalEnclosedParen
            decimalEnclosedCircleChinese
            ideographEnclosedCircle
            ideographTraditional
            ideographZodiac
            ideographZodiacTraditional
            taiwaneseCounting
            ideographLegalTraditional
            taiwaneseCountingThousand
            taiwaneseDigital
            chineseCounting
            chineseLegalSimplified
            chineseCountingThousand
            koreanDigital
            koreanCounting
            koreanLegal
            koreanDigital2
            vietnameseCounting
            russianLower russianUpper
            none numberInDash
            hebrew1 hebrew2
            arabicAlpha arabicAbjad
            hindiVowels hindiConsonants hindiNumbers hindiCounting
            thaiLetters thaiNumbers thaiCounting
            bahtText
            dollarText custom)
        end
      end
    end
  end
end
