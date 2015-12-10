module OpenXml
  module Docx
    module Properties
      class Font < ComplexProperty
        tag :rFonts

        with_namespace :w do
          attribute :ascii, expects: :string
          attribute :ascii_theme, one_of: %i(majorAscii majorBidi majorEastAsia
                                                majorHAnsi minorAscii minorBidi
                                                minorEastAsia minorHAnsi)
          attribute :complex, expects: :string, displays_as: :cs
          attribute :complex_theme, displays_as: :cstheme, one_of: %i(majorAscii majorBidi majorEastAsia
                                                                      majorHAnsi minorAscii minorBidi
                                                                      minorEastAsia minorHAnsi)
          attribute :east_asia, expects: :string
          attribute :east_asia_theme, one_of: %i(majorAscii majorBidi majorEastAsia
                                                majorHAnsi minorAscii minorBidi
                                                minorEastAsia minorHAnsi)
          attribute :high_ansi, expects: :string, displays_as: :hAnsi
          attribute :high_ansi_theme, displays_as: :hAnsiTheme, one_of: %i(majorAscii majorBidi majorEastAsia
                                                                        majorHAnsi minorAscii minorBidi
                                                                        minorEastAsia minorHAnsi)
          attribute :hint, one_of: %i(cs default eastAsia)
        end

      end
    end
  end
end
