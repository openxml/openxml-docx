module OpenXml
  module Docx
    module Properties
      class ConditionalFormatting < ComplexProperty
        tag :cnfStyle

        with_namespace :w do
          attribute :even_horizontal_band, expects: :true_or_false, displays_as: :evenHBand
          attribute :even_vertical_band, expects: :true_or_false, displays_as: :evenVBand
          attribute :first_column, expects: :true_or_false
          attribute :first_row, expects: :true_or_false
          attribute :first_row_first_column, expects: :true_or_false
          attribute :first_row_last_column, expects: :true_or_false
          attribute :last_column, expects: :true_or_false
          attribute :last_row, expects: :true_or_false
          attribute :last_row_first_column, expects: :true_or_false
          attribute :last_row_last_column, expects: :true_or_false
          attribute :odd_horizontal_band, expects: :true_or_false, displays_as: :oddHBand
          attribute :odd_vertical_band, expects: :true_or_false, displays_as: :oddVBand
        end

      end
    end
  end
end
