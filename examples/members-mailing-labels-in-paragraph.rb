$:.push Dir.pwd + "/lib"
require "openxml/docx"
require "openxml/vml"
require "forgery"

include OpenXml::Docx::Elements

document = OpenXml::Docx::Package.new
document.embed_truetype_font(path: "examples/USPSIMBCompact.ttf", name: "USPSIMBCompact")
TABLE_GRID = [5760, 270, 5760]

COMMON_STYLES = """
  position:absolute;
  width:4in;
  visibility:visible;
  mso-wrap-style:square;
  mso-width-percent:0;
  mso-height-percent:0;
  mso-wrap-distance-left:9pt;
  mso-wrap-distance-top:0;
  mso-wrap-distance-right:9pt;
  mso-wrap-distance-bottom:0;
  mso-position-horizontal:absolute;
  mso-position-horizontal-relative:page;
  mso-position-vertical:absolute;
  mso-position-vertical-relative:page;
  mso-width-percent:0;
  mso-height-percent:0;
  mso-width-relative:page;
  mso-height-relative:page;
  v-text-anchor:top;
  height:96pt;
"""

STYLES = [
  [ "margin-left:11.25pt;margin-top:60.1pt;z-index:251651072;",
    "margin-left:312.75pt;margin-top:60.1pt;z-index:251652096;"
  ],
  [ "margin-left:11.25pt;margin-top:156.1pt;z-index:251653120;",
    "margin-left:312.75pt;margin-top:156.1pt;z-index:251654144;"
  ],
  [ "margin-left:11.25pt;margin-top:252.1pt;z-index:251655168;",
    "margin-left:312.75pt;margin-top:252.1pt;z-index:251656192;"
  ],
  [ "margin-left:11.25pt;margin-top:348.1pt;z-index:251657216;",
    "margin-left:312.75pt;margin-top:348.1pt;z-index:251658240;"
  ],
  [ "margin-left:11.25pt;margin-top:444.1pt;z-index:251659264;",
    "margin-left:312.75pt;margin-top:444.1pt;z-index:251660288;"
  ],
  [ "margin-left:11.25pt;margin-top:540.1pt;z-index:251661312;",
    "margin-left:312.75pt;margin-top:540.1pt;z-index:251662336;"
  ],
  [ "margin-left:11.25pt;margin-top:636.1pt;z-index:251663360;",
    "margin-left:312.75pt;margin-top:636.1pt;z-index:251664384;"
  ],
]

def full_name
  "#{Forgery('name').full_name}"
end

def street_address
  "#{Forgery('address').street_address}"
end

def city_state
  "#{Forgery('address').city}, #{Forgery('address').state} #{Forgery('address').zip}"
end

## Global Table Settings
table = Table.new
table.table_width.type = :auto
table.table_width.width = 0
table.table_layout = :fixed

start_margin = OpenXml::Docx::Properties::TableCellMargin.new(:start)
end_margin = OpenXml::Docx::Properties::TableCellMargin.new(:end)
start_margin.type = :dxa
start_margin.width = 115
end_margin.type = :dxa
end_margin.width = 115
table.table_cell_margins << start_margin
table.table_cell_margins << end_margin

table.table_look.firstColumn = false
table.table_look.firstRow = false
table.table_look.lastColumn = false
table.table_look.lastRow = false
table.table_look.noHBand = false
table.table_look.noVBand = false

table_grid = TableGrid.new
TABLE_GRID.each do |width|
  grid_column = GridColumn.new
  grid_column.w = width
  table_grid << grid_column
end

table << table_grid

### END Table Globals


28.times do |i|
  ## New Row
  table_row = TableRow.new
  table_row.table_row_height.hRule = :exact
  table_row.table_row_height.val = 1919
  ## END Row

  ## Left Cell
  table_cell_left = TableCell.new

  table_cell_width = OpenXml::Docx::Properties::TableCellWidth.new
  table_cell_width.type = :dxa
  table_cell_width.width = 5760
  table_cell_left << table_cell_width

  top_margin = OpenXml::Docx::Properties::TableCellMargin.new(:top)
  top_margin.type = :dxa
  top_margin.width = 0

  bottom_margin = OpenXml::Docx::Properties::TableCellMargin.new(:bottom)
  bottom_margin.type = :dxa
  bottom_margin.width = 0

  start_margin = OpenXml::Docx::Properties::TableCellMargin.new(:start)
  start_margin.type = :dxa
  start_margin.width = 122

  end_margin = OpenXml::Docx::Properties::TableCellMargin.new(:end)
  end_margin.type = :dxa
  end_margin.width = 122

  table_cell_left.table_cell_cell_margin << top_margin
  table_cell_left.table_cell_cell_margin << bottom_margin
  table_cell_left.table_cell_cell_margin << start_margin
  table_cell_left.table_cell_cell_margin << end_margin

  table_cell_left.v_align = :center

  outline_run = Run.new

  vml_container = VmlContainer.new

  round_rectangle = OpenXml::Vml::Elements::RoundedRectangle.new
  round_rectangle.arc_size = "4915f"
  round_rectangle.filled = :false
  round_rectangle.allow_in_cell = :false
  round_rectangle.optional_string = "_x0000_s1026"
  round_rectangle.stroke_color = "#bfbfbf"
  round_rectangle.stroke_weight = ".25pt"
  round_rectangle.print = :false
  style_string = "#{COMMON_STYLES}#{STYLES[i%7][0]}"
  round_rectangle.style = style_string

  vml_container << round_rectangle

  outline_run << vml_container

  paragraph = Paragraph.new
  paragraph << outline_run

  run = OpenXml::Docx::Elements::Run.new
  run.font.ascii = "USPSIMBCompact"
  run << OpenXml::Docx::Elements::Text.new("DDTTTADAADDAAFTAFTFFTTFDDATDDDFTAFTTTTAFDATFDAAFFAFATDFATATTAFFDD")
  run.font_size = 28
  run << Break.new
  paragraph << run

  left_run = Run.new
  left_run << Text.new(full_name)
  left_run << Break.new
  left_run << Text.new(street_address)
  left_run << Break.new
  left_run << Text.new(city_state)

  paragraph << left_run

  table_cell_left << paragraph
  table_row << table_cell_left
  # End Left Cell

  # Bumper Table Cell
  table_cell_bumper = TableCell.new

  table_cell_bumper.table_cell_width.type = :dxa
  table_cell_bumper.table_cell_width.width = 270

  paragraph = Paragraph.new
  table_cell_bumper << paragraph

  table_row << table_cell_bumper

  ## Right Cell
  table_cell_right = TableCell.new

  table_cell_width = OpenXml::Docx::Properties::TableCellWidth.new
  table_cell_width.type = :dxa
  table_cell_width.width = 5760
  table_cell_right << table_cell_width

  top_margin = OpenXml::Docx::Properties::TableCellMargin.new(:top)
  top_margin.type = :dxa
  top_margin.width = 0

  bottom_margin = OpenXml::Docx::Properties::TableCellMargin.new(:bottom)
  bottom_margin.type = :dxa
  bottom_margin.width = 0

  start_margin = OpenXml::Docx::Properties::TableCellMargin.new(:start)
  start_margin.type = :dxa
  start_margin.width = 122

  end_margin = OpenXml::Docx::Properties::TableCellMargin.new(:end)
  end_margin.type = :dxa
  end_margin.width = 122

  table_cell_right.table_cell_cell_margin << top_margin
  table_cell_right.table_cell_cell_margin << bottom_margin
  table_cell_right.table_cell_cell_margin << start_margin
  table_cell_right.table_cell_cell_margin << end_margin

  table_cell_right.v_align = :center

  outline_run_right = Run.new

  vml_container = VmlContainer.new

  round_rectangle = OpenXml::Vml::Elements::RoundedRectangle.new
  round_rectangle.arc_size = "4915f"
  round_rectangle.filled = :false
  round_rectangle.allow_in_cell = :false
  round_rectangle.optional_string = "_x0000_s1026"
  round_rectangle.stroke_color = "#bfbfbf"
  round_rectangle.stroke_weight = ".25pt"
  round_rectangle.print = :false
  style_string = "#{COMMON_STYLES}#{STYLES[i%7][1]}"
  round_rectangle.style = style_string

  vml_container << round_rectangle

  outline_run_right << vml_container

  paragraph = Paragraph.new
  paragraph << outline_run_right

  run = OpenXml::Docx::Elements::Run.new
  run.font.ascii = "USPSIMBCompact"
  run << OpenXml::Docx::Elements::Text.new("DDTTTADAADDAAFTAFTFFTTFDDATDDDFTAFTTTTAFDATFDAAFFAFATDFATATTAFFDD")
  run.font_size = 28
  run << Break.new
  paragraph << run


  right_run = Run.new
  right_run << Text.new(full_name)
  right_run << Break.new
  right_run << Text.new(street_address)
  right_run << Break.new
  right_run << Text.new(city_state)

  paragraph << right_run

  table_cell_right << paragraph
  table_row << table_cell_right
  # END Right Cell
  table << table_row
end

document.document << table

outline_paragraph = Paragraph.new
outline_paragraph.spacing.after = 0
outline_paragraph.spacing.line = 20
outline_paragraph.spacing.line_rule = :exact

7.times do |i|
  outline_run = Run.new

  vml_container = VmlContainer.new

  round_rectangle = OpenXml::Vml::Elements::RoundedRectangle.new
  round_rectangle.arc_size = "4915f"
  round_rectangle.filled = :false
  round_rectangle.allow_in_cell = :false
  round_rectangle.optional_string = "_x0000_s1026"
  round_rectangle.stroke_color = "#bfbfbf"
  round_rectangle.stroke_weight = ".25pt"
  round_rectangle.print = :false
  style_string = "#{COMMON_STYLES}#{STYLES[i%7][0]}"
  round_rectangle.style = style_string

  vml_container << round_rectangle

  outline_run << vml_container

  outline_paragraph << outline_run

  outline_run_right = Run.new

  vml_container = VmlContainer.new

  round_rectangle = OpenXml::Vml::Elements::RoundedRectangle.new
  round_rectangle.arc_size = "4915f"
  round_rectangle.filled = :false
  round_rectangle.allow_in_cell = :false
  round_rectangle.optional_string = "_x0000_s1026"
  round_rectangle.stroke_color = "#bfbfbf"
  round_rectangle.stroke_weight = ".25pt"
  round_rectangle.print = :false
  style_string = "#{COMMON_STYLES}#{STYLES[i%7][1]}"
  round_rectangle.style = style_string

  vml_container << round_rectangle

  outline_run_right << vml_container

  outline_paragraph << outline_run_right

end

document.document << outline_paragraph

paragraph = Paragraph.new
paragraph.page_break_before = true
document.document << paragraph

section_properties = SectionProperties.new

page_size = OpenXml::Docx::Properties::PageSize.new
page_size.height = 15840
page_size.width = 12240
section_properties << page_size

page_margin = OpenXml::Docx::Properties::PageMargins.new
page_margin.bottom = 820
page_margin.footer = 0
page_margin.gutter = 0
page_margin.header = 0
page_margin.left = 349
page_margin.right = 0
page_margin.top = 1199

section_properties << page_margin

columns = OpenXml::Docx::Properties::Columns.new
columns.space = 720

section_properties << columns
document.document << section_properties

filename = "mailing_labels.docx"
system "rm -f ~/Desktop/#{filename}" # -f so that we don't have an error if the file doesn't exist
document.save File.expand_path("~/Desktop/#{filename}")
exec "open ~/Desktop/#{filename}"
