require "spec_helper"

describe OpenXml::Docx::Properties::NoWrap do
  include ValuePropertyTestMacros

  it_should_use tag: :noWrap, name: "no_wrap"

  with_value(true) do
    it_should_work
    it_should_output "<w:noWrap/>"
  end

  with_value(false) do
    it_should_work
    it_should_output ""
  end

  with_value(nil) do
    it_should_work
    it_should_output ""
  end

end
