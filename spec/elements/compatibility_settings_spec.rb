require "spec_helper"

describe OpenXml::Docx::Elements::CompatibilitySettings do
  include ElementTestMacros

  it_should_use tag: :compat, name: "compatibility_settings"

end
