require "spec_helper"

describe OpenXml::DrawingML::Elements::ShapeGuide do
  include ElementTestMacros

  it_should_use tag: :gd, name: "shape_guide"

  formulae = [ "*/ h 10 -100",
               "+- h 10 -100",
               "+/ h 10 -100",
               "?: h 10 -100",
               "abs -100",
               "at2 h w",
               "cat2 h w 100",
               "cos h w",
               "max 100 200",
               "min 100 200",
               "mod h w 10",
               "pin h 10 -100",
               "sat2 h 10 -100",
               "sin h w",
               "sqrt 4",
               "tan h w",
               "val 100" ] # Arguments to formulae can be a variable, a positive integer, or a negative integer

  for_attribute(:guide_name) do
    with_value("Some String") do
      it_should_assign_successfully
      it_should_output "<a:gd name=\"Some String\"/>"
    end

    with_values([1, :not_a_string]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:formula, displays_as: :fmla) do
    with_values(formulae) do
      it_should_assign_successfully
    end

    with_value("*/ h 10 -100") do
      it_should_assign_successfully
      it_should_output "<a:gd fmla=\"*/ h 10 -100\"/>"
    end

    not_allowed = ["a^2 + b^2 = c^2", "Not a formula", 2 ]
    with_values(not_allowed) do # Not a valid formula
      it_should_raise_an_exception
    end
  end

end
