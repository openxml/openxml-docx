module OpenXml
  module Docx
    module Properties
      class PageNumbering < ComplexProperty
        tag :pgNumType

        attribute :chapter_separator, expects: :valid_chapter_separator, displays_as: :chapSep
        attribute :chapter_style, expects: :integer, displays_as: :chapStyle
        attribute :format, expects: :valid_page_number_format, displays_as: :fmt
        attribute :start, expects: :integer

        VALID_CHAPTER_SEPARATORS = %i(colon emDash enDash hyphen period)
        VALID_PAGE_NUMBER_FORMATS = %i(aiueo
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

      private

        def valid_chapter_separator(value)
          valid_in? value, VALID_CHAPTER_SEPARATORS
        end

        def valid_page_number_format(value)
          valid_in? value, VALID_PAGE_NUMBER_FORMATS
        end

      end
    end
  end
end
