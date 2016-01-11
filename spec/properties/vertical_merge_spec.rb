require "spec_helper"

describe OpenXml::Docx::Properties::VerticalMerge do
  include ValuePropertyTestMacros

  it_should_use tag: :vMerge, name: "vertical_merge", value: :restart

  with_value(:restart) do
    it_should_work
    it_should_output "<w:vMerge w:val=\"restart\"/>"
  end

  with_value(:continue) do
    it_should_work
    it_should_output "<w:vMerge w:val=\"continue\"/>"
  end

  with_value(:not_ok) do
    it_should_not_work
  end

end
