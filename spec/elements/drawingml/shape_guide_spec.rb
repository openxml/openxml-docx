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

    with_value(1) do
      it_should_raise_an_exception
    end

    with_value(:not_a_string) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:formula) do
    formulae.each do |formula|
      with_value(formula) do
        it_should_assign_successfully
        it_should_output "<a:gd fmla=\"#{formula}\"/>"
      end
    end

    with_value("a^2 + b^2 = c^2") do # Not a valid formula
      it_should_raise_an_exception
    end

    with_value("Not a formula") do
      it_should_raise_an_exception
    end

    with_value(2) do
      it_should_raise_an_exception
    end
  end

end
