module Rocx
  module Properties
    class Font < ComplexProperty
      include AttributeBuilder

      tag :rFonts

      attribute :ascii, expects: :string
      attribute :ascii_theme, expects: :valid_theme
      attribute :complex, expects: :string, displays_as: :cs
      attribute :complex_theme, expects: :valid_theme, displays_as: :cstheme
      attribute :east_asia, expects: :string
      attribute :east_asia_theme, expects: :valid_theme
      attribute :high_ansi, expects: :string, displays_as: :hAnsi
      attribute :high_ansi_theme, expects: :valid_theme, displays_as: :hAnsiTheme
      attribute :hint, expects: :valid_hint

      VALID_HINTS = %i(cs default eastAsia)

      VALID_THEMES = %i(majorAscii majorBidi majorEastAsia majorHAnsi minorAscii minorBidi minorEastAsia minorHAnsi)

    private

      def valid_theme(value)
        valid_in? value, VALID_THEMES
      end

      def valid_hint(value)
        valid_in? value, VALID_HINTS
      end

    end
  end
end
