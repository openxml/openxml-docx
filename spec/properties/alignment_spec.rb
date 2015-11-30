require "spec_helper"

describe OpenXml::Docx::Properties::Alignment do
  include ValuePropertyTestMacros

  it_should_use tag: :jc, name: "alignment", value: :end

  with_value(:both) do
    it_should_work
    it_should_output "<w:jc w:val=\"both\"/>"
  end

  with_value(:center) do
    it_should_work
    it_should_output "<w:jc w:val=\"center\"/>"
  end

  with_value(:distribute) do
    it_should_work
    it_should_output "<w:jc w:val=\"distribute\"/>"
  end

  with_value(:end) do
    it_should_work
    it_should_output "<w:jc w:val=\"end\"/>"
  end

  with_value(:highKashida) do
    it_should_work
    it_should_output "<w:jc w:val=\"highKashida\"/>"
  end

  with_value(:lowKashida) do
    it_should_work
    it_should_output "<w:jc w:val=\"lowKashida\"/>"
  end

  with_value(:mediumKashida) do
    it_should_work
    it_should_output "<w:jc w:val=\"mediumKashida\"/>"
  end

  with_value(:numTab) do
    it_should_work
    it_should_output "<w:jc w:val=\"numTab\"/>"
  end

  with_value(:start) do
    it_should_work
    it_should_output "<w:jc w:val=\"start\"/>"
  end

  with_value(:thaiDistribute) do
    it_should_work
    it_should_output "<w:jc w:val=\"thaiDistribute\"/>"
  end

end
