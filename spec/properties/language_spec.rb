require "spec_helper"

describe OpenXml::Docx::Properties::Language do
  include PropertyTestMacros

  it_should_use tag: :lang, name: "language"

  for_attribute(:bidi) do
    it_should_assign_and_output_xml "en-US"
  end

  for_attribute(:east_asia) do
    it_should_assign_and_output_xml "ko-KR"
  end

  for_attribute(:latin) do
    it_should_assign_and_output_xml "fr-CA"
  end

end
