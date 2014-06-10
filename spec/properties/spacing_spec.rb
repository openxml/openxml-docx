require "spec_helper"

describe Rocx::Properties::Spacing do
  include PropertyTestMacros

  it_should_use tag: :spacing, name: "spacing"

  for_attribute(:after) do
    with_value(24) do
      it_should_assign_successfully
      it_should_output "<w:spacing w:after=\"24\"/>"
    end

    with_value(-24) do
      it_should_raise_an_exception
    end

    with_value(:big) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:after_auto) do
    with_value(:on) do
      it_should_assign_successfully
      it_should_output "<w:spacing w:afterAutospacing=\"on\"/>"
    end

    with_value(:off) do
      it_should_assign_successfully
      it_should_output "<w:spacing w:afterAutospacing=\"off\"/>"
    end

    with_value(:on_and_off) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:after_lines) do
    with_value(24) do
      it_should_assign_successfully
      it_should_output "<w:spacing w:afterLines=\"24\"/>"
    end

    with_value(-24) do
      it_should_assign_successfully
      it_should_output "<w:spacing w:afterLines=\"-24\"/>"
    end

    with_value(2.56) do
      it_should_raise_an_exception
    end

    with_value(:big) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:before) do
    with_value(24) do
      it_should_assign_successfully
      it_should_output "<w:spacing w:before=\"24\"/>"
    end

    with_value(-24) do
      it_should_raise_an_exception
    end

    with_value(:big) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:before_auto) do
    with_value(:on) do
      it_should_assign_successfully
      it_should_output "<w:spacing w:beforeAutospacing=\"on\"/>"
    end

    with_value(:off) do
      it_should_assign_successfully
      it_should_output "<w:spacing w:beforeAutospacing=\"off\"/>"
    end

    with_value(:on_and_off) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:before_lines) do
    with_value(24) do
      it_should_assign_successfully
      it_should_output "<w:spacing w:beforeLines=\"24\"/>"
    end

    with_value(-24) do
      it_should_assign_successfully
      it_should_output "<w:spacing w:beforeLines=\"-24\"/>"
    end

    with_value(2.56) do
      it_should_raise_an_exception
    end

    with_value(:big) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:line) do
    with_value(24) do
      it_should_assign_successfully
      it_should_output "<w:spacing w:line=\"24\"/>"
    end

    with_value(-24) do
      it_should_assign_successfully
      it_should_output "<w:spacing w:line=\"-24\"/>"
    end

    with_value(2.56) do
      it_should_raise_an_exception
    end

    with_value(:big) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:line_rule) do
    with_value(:atLeast) do
      it_should_assign_successfully
      it_should_output "<w:spacing w:lineRule=\"atLeast\"/>"
    end

    with_value(:auto) do
      it_should_assign_successfully
      it_should_output "<w:spacing w:lineRule=\"auto\"/>"
    end

    with_value(:exact) do
      it_should_assign_successfully
      it_should_output "<w:spacing w:lineRule=\"exact\"/>"
    end

    with_value(:something) do
      it_should_raise_an_exception
    end
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(line: 276, line_rule: :auto) do
    it_should_output "<w:spacing w:line=\"276\" w:lineRule=\"auto\"/>", assign: false
  end

end
