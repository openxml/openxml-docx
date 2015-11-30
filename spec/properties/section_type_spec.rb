require "spec_helper"

describe OpenXml::Docx::Properties::SectionType do
  include ValuePropertyTestMacros

  it_should_use tag: :type, name: "type", value: :oddPage

  with_value(:continuous) do
    it_should_work
    it_should_output "<w:type w:val=\"continuous\"/>"
  end

  with_value(:evenPage) do
    it_should_work
    it_should_output "<w:type w:val=\"evenPage\"/>"
  end

  with_value(:nextColumn) do
    it_should_work
    it_should_output "<w:type w:val=\"nextColumn\"/>"
  end

  with_value(:nextPage) do
    it_should_work
    it_should_output "<w:type w:val=\"nextPage\"/>"
  end

  with_value(:oddPage) do
    it_should_work
    it_should_output "<w:type w:val=\"oddPage\"/>"
  end

end
