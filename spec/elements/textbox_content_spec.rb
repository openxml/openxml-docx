require "spec_helper"

describe OpenXml::Docx::Elements::TextboxContent do
  include ElementTestMacros

  it_should_use tag: :txbxContent, name: "textbox_content"

end
