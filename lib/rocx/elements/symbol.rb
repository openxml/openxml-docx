module Rocx
  module Elements
    class Symbol < Element
      tag :sym

      attribute :font, expects: :string
      attribute :character, expects: :hex_digit_4, displays_as: :char

    end
  end
end
