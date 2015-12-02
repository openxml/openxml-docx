require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingDrawingWrapNone do
  include ElementTestMacros

  it_should_use tag: :wrapNone, name: "word_processing_drawing_wrap_none"

  with_no_attributes_set do
    it_should_output "<wp:wrapNone/>", assign: false
  end

end
