require "spec_helper"

describe OpenXml::Docx::Properties::VAlign do
  include ValuePropertyTestMacros

  it_should_use tag: :vAlign, name: "v_align", value: :both

  %i(both bottom center top).each do |good_value|
    with_value(good_value) do
      it_should_work
      it_should_output "<w:vAlign w:val=\"#{good_value}\"/>"
    end
  end

  with_value(:invalid) do
    it_should_not_work
  end

end
