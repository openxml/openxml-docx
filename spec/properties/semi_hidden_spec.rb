require "spec_helper"

describe OpenXml::Docx::Properties::SemiHidden do
  include ValuePropertyTestMacros

  it_should_use tag: :semiHidden, name: "semi_hidden", value: true

  with_value(true) do
    it_should_work
    it_should_output "<w:semiHidden/>"
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
