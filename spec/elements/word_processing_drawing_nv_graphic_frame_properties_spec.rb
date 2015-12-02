require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingDrawingNvGraphicFrameProperties do
  include ElementTestMacros

  it_should_use tag: :cNvGraphicFramePr, name: "word_processing_drawing_nv_graphic_frame_properties"

  with_no_attributes_set do
    it_should_output "<wp:cNvGraphicFramePr/>", assign: false
  end
end
