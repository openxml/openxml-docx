require "spec_helper"

describe Rocx::Properties::Language do
  include PropertyTestMacros

  it_should_use tag: :lang, name: "language"

  for_attribute(:bidi) do
    with_value("en-US") do
      it_should_assign_successfully
      it_should_output "<w:lang w:bidi=\"en-US\"/>"
    end
  end

  for_attribute(:east_asia) do
    with_value("ko-KR") do
      it_should_assign_successfully
      it_should_output "<w:lang w:eastAsia=\"ko-KR\"/>"
    end
  end

  for_attribute(:latin) do
    with_value("fr-CA") do
      it_should_assign_successfully
      it_should_output "<w:lang w:val=\"fr-CA\"/>"
    end
  end

end
