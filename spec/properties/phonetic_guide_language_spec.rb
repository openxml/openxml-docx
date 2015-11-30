require "spec_helper"

describe OpenXml::Docx::Properties::PhoneticGuideLanguage do
  include ValuePropertyTestMacros

  it_should_use tag: :lid, name: "language", value: "ja-JP"

  with_value("ja-JP") do
    it_should_work
    it_should_output "<w:lid w:val=\"ja-JP\"/>"
  end
end
