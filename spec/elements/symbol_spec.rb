require "spec_helper"

describe Rocx::Elements::Symbol do
  include ElementTestMacros

  it_should_use tag: :sym, name: "symbol"

  for_attribute(:font) do
    with_value("Wingdings") do
      it_should_assign_successfully
      it_should_output "<w:sym w:font=\"Wingdings\"/>"
    end

    with_value(123) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:character) do
    with_value("43FD") do
      it_should_assign_successfully
      it_should_output "<w:sym w:char=\"43FD\"/>"
    end

    with_value("43gg") do
      it_should_raise_an_exception
    end

    with_value("abcdef") do
      it_should_raise_an_exception
    end
  end

end
