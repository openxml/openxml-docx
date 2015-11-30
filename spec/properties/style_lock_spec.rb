require "spec_helper"

describe OpenXml::Docx::Properties::StyleLock do
  include ValuePropertyTestMacros

  it_should_use tag: :locked, name: "style_lock"

  with_value(true) do
    it_should_work
    it_should_output "<w:locked/>"
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
