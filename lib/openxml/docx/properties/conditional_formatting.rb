module OpenXml
  module Docx
    module Properties
      class ConditionalFormatting < ComplexProperty
        tag :cnfStyle

        with_namespace :w do
          attribute :even_horizontal_band, expects: :boolean, displays_as: :evenHBand
          attribute :even_vertical_band, expects: :boolean, displays_as: :evenVBand
          attribute :first_column, expects: :boolean
          attribute :first_row, expects: :boolean
          attribute :first_row_first_column, expects: :boolean
          attribute :first_row_last_column, expects: :boolean
          attribute :last_column, expects: :boolean
          attribute :last_row, expects: :boolean
          attribute :last_row_first_column, expects: :boolean
          attribute :last_row_last_column, expects: :boolean
          attribute :odd_horizontal_band, expects: :boolean, displays_as: :oddHBand
          attribute :odd_vertical_band, expects: :boolean, displays_as: :oddVBand
        end

      end
    end
  end
end
