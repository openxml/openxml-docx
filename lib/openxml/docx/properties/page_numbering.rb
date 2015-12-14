module OpenXml
  module Docx
    module Properties
      class PageNumbering < ComplexProperty
        tag :pgNumType

        with_namespace :w do
          attribute :chapter_separator, one_of: %i(colon emDash enDash hyphen period), displays_as: :chapSep
          attribute :chapter_style, expects: :integer, displays_as: :chapStyle
          attribute :start, expects: :integer
          attribute :format, displays_as: :fmt, one_of: %i(aiueo
                                                           aiueoFullWidth
                                                           arabicAbjad
                                                           arabicAlpha
                                                           bahtText
                                                           bullet
                                                           cardinalText
                                                           chicago
                                                           chineseCounting
                                                           chineseCountingThousand
                                                           chineseLegalSimplified
                                                           chosung
                                                           custom
                                                           decimal
                                                           decimalEnclosedCircle
                                                           decimalEnclosedCircleChinese
                                                           decimalEnclosedFullstop
                                                           decimalEnclosedParen
                                                           decimalFullWidth
                                                           decimalHalfWidth
                                                           decimalZero
                                                           dollarText
                                                           ganada
                                                           hebrew1
                                                           hebrew2
                                                           hex
                                                           hindiConsonants
                                                           hindiCounting
                                                           hindiNumbers
                                                           hindiVowels
                                                           ideographDigital
                                                           ideographEnclosedCircle
                                                           taiwaneseDigital
                                                           ideographLegalTraditional
                                                           ideographTraditional
                                                           ideographZodiac
                                                           ideographZodiacTraditional
                                                           iroha
                                                           irohaFullWidth
                                                           japaneseCounting
                                                           japaneseDigitalTenThousand
                                                           japaneseLegal
                                                           koreanCounting
                                                           koreanDigital
                                                           koreanDigital2
                                                           koreanLegal
                                                           lowerLetter
                                                           lowerRoman
                                                           none
                                                           numberInDash
                                                           ordinal
                                                           ordinalText
                                                           russianLower
                                                           russianUpper
                                                           taiwaneseCounting
                                                           taiwaneseCountingThousand
                                                           thaiCounting
                                                           thaiLetters
                                                           thaiNumbers
                                                           upperLetter
                                                           upperRoman
                                                           vietnameseCounting)


        end


      end
    end
  end
end
