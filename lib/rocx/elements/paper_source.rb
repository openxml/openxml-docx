module Rocx
  module Properties
    class PaperSource < ComplexProperty
      tag :paperSrc

      attribute :first, expects: :integer
      attribute :other, expects: :integer

    end
  end
end
