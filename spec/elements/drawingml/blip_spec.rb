require "spec_helper"

describe OpenXml::DrawingML::Elements::Blip do
  include ElementTestMacros

  it_should_use tag: :blip, name: "blip"

  for_attribute(:compression_state) do
    %i(email hqprint none print screen).each do |good_value|
      with_value(good_value) do
        it_should_assign_successfully
        it_should_output "<a:blip cstate=\"#{good_value}\"/>"
      end
    end

    with_value(:no_good) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:embed) do
    with_value("StringRelId") do
      it_should_assign_successfully
      it_should_output "<a:blip r:embed=\"StringRelId\"/>"
    end

    with_value(:not_a_string) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:link) do
    with_value("ExternalStringRelId") do
      it_should_assign_successfully
      it_should_output "<a:blip r:link=\"ExternalStringRelId\"/>"
    end

    with_value(:not_a_string) do
      it_should_raise_an_exception
    end
  end

  with_no_attributes_set do
    it_should_output "<a:blip/>", assign: false
  end

end
