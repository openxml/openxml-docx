require "spec_helper"

describe Rocx::Properties::Column do
  include PropertyTestMacros

  it_should_use tag: :col, name: "column", value: [1, 1]

  for_attribute(:space) do
    with_value(2) do
      it_should_assign_successfully 1, 1
      it_should_output "<w:col w:space=\"2\" w:w=\"1\"/>", 1, 1
    end

    with_value(-1) do
      it_should_raise_an_exception
    end

    with_value(12.1) do
      it_should_raise_an_exception
    end

    with_value(:big) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:width) do
    with_value(2) do
      it_should_assign_successfully 1, 1
      it_should_output "<w:col w:space=\"1\" w:w=\"2\"/>", 1, 1
    end

    with_value(-1) do
      it_should_raise_an_exception
    end

    with_value(12.1) do
      it_should_raise_an_exception
    end

    with_value(:big) do
      it_should_raise_an_exception
    end
  end

end
