require "spec_helper"

describe OpenXml::Docx::Elements::GroupShape do
  include ElementTestMacros

  it_should_use tag: :grpSp, name: "group_shape"

  with_no_attributes_set do
    it_should_output "<w:grpSp/>", assign: false
  end
end
