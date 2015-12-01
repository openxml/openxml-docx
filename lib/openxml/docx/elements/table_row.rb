module OpenXml
  module Docx
    module Elements
      class TableRow < Container
        tag :tr

        with_namespace :w do
          attribute :rsidDel, expects: :valid_long_hex
          attribute :rsidR, expects: :valid_long_hex
          attribute :rsidRPr, expects: :valid_long_hex
          attribute :risdTr, expects: :valid_long_hex
        end

        value_property :cant_split
        value_property :div_id
        value_property :grid_after
        value_property :grid_before
        value_property :hidden
        value_property :alignment
        value_property :table_header
        value_property :v_align

        property :conditional_formatting
        property :table_cell_spacing
        property :tr_height
        property :w_after
        property :w_before

      private

        def valid_long_hex(value)
          value =~ /^[0-9a-f]+$/i
        end

      end
    end
  end
end
