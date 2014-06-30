require "spec_helper"

describe Rocx::Section do
  include ElementTestMacros

  it_should_have_property :document_grid
  it_should_have_property :line_numbering
  it_should_have_property :page_margins
  it_should_have_property :page_borders
  it_should_have_property :page_numbering
  it_should_have_property :page_size
  it_should_have_property :paper_source

  it_should_have_value_property :bidi
  it_should_have_value_property :form_protection
  it_should_have_value_property :rtl_gutter
  it_should_have_value_property :text_direction, with_value: :lr
  it_should_have_value_property :type, as_instance_of: :section_type, with_value: :oddPage
  it_should_have_value_property :vertical_alignment, as_instance_of: :vertical_text_alignment, with_value: :both

end
