require "spec_helper"

describe Rocx::Properties::Frame do
  include PropertyTestMacros

  it_should_use tag: :framePr, name: "frame"

  for_attribute(:anchor_lock) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:anchorLock=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output ""
    end

    with_value(:maybe) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:drop_cap) do
    with_value(:drop) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:dropCap=\"drop\"/>"
    end

    with_value(:margin) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:dropCap=\"margin\"/>"
    end

    with_value(:none) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:dropCap=\"none\"/>"
    end

    with_value(:bad) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:height) do
    with_value(24) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:h=\"24\"/>"
    end

    with_value(-24) do
      it_should_raise_an_exception
    end

    with_value(:big) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:horizontal_anchor) do
    with_value(:margin) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:hAnchor=\"margin\"/>"
    end

    with_value(:page) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:hAnchor=\"page\"/>"
    end

    with_value(:text) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:hAnchor=\"text\"/>"
    end
  end

  for_attribute(:height_rule) do
    with_value(:atLeast) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:hRule=\"atLeast\"/>"
    end

    with_value(:auto) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:hRule=\"auto\"/>"
    end

    with_value(:exact) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:hRule=\"exact\"/>"
    end

    with_value(:something_bad) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:horizontal_padding) do
    with_value(24) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:hSpace=\"24\"/>"
    end

    with_value(-23) do
      it_should_raise_an_exception
    end

    with_value(19.4) do
      it_should_raise_an_exception
    end

    with_value(:two) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:lines) do
    with_value(24) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:lines=\"24\"/>"
    end

    with_value(-23) do
      it_should_raise_an_exception
    end

    with_value(19.4) do
      it_should_raise_an_exception
    end

    with_value(:two) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:vertical_anchor) do
    with_value(:margin) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:vAnchor=\"margin\"/>"
    end

    with_value(:page) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:vAnchor=\"page\"/>"
    end

    with_value(:text) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:vAnchor=\"text\"/>"
    end

    with_value(:something_bad) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:vertical_padding) do
    with_value(24) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:vSpace=\"24\"/>"
    end

    with_value(-23) do
      it_should_raise_an_exception
    end

    with_value(19.4) do
      it_should_raise_an_exception
    end

    with_value(:two) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:width) do
    with_value(24) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:w=\"24\"/>"
    end

    with_value(-23) do
      it_should_raise_an_exception
    end

    with_value(19.4) do
      it_should_raise_an_exception
    end

    with_value(:two) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:wrap) do
    with_value(:around) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:wrap=\"around\"/>"
    end

    with_value(:auto) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:wrap=\"auto\"/>"
    end

    with_value(:none) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:wrap=\"none\"/>"
    end

    with_value(:notBeside) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:wrap=\"notBeside\"/>"
    end

    with_value(:through) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:wrap=\"through\"/>"
    end

    with_value(:tight) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:wrap=\"tight\"/>"
    end

    with_value(:something_bad) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:horizontal_position) do
    with_value(24) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:x=\"24\"/>"
    end

    with_value(-23) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:x=\"-23\"/>"
    end

    with_value(19.4) do
      it_should_raise_an_exception
    end

    with_value(:two) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:relative_horizontal_position) do
    with_value(:center) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:xAlign=\"center\"/>"
    end

    with_value(:inside) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:xAlign=\"inside\"/>"
    end

    with_value(:left) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:xAlign=\"left\"/>"
    end

    with_value(:outside) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:xAlign=\"outside\"/>"
    end

    with_value(:right) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:xAlign=\"right\"/>"
    end

    with_value(:something_bad) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:vertical_position) do
    with_value(24) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:y=\"24\"/>"
    end

    with_value(-23) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:y=\"-23\"/>"
    end

    with_value(19.4) do
      it_should_raise_an_exception
    end

    with_value(:two) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:relative_vertical_position) do
    with_value(:bottom) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:yAlign=\"bottom\"/>"
    end

    with_value(:center) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:yAlign=\"center\"/>"
    end

    with_value(:inline) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:yAlign=\"inline\"/>"
    end

    with_value(:inside) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:yAlign=\"inside\"/>"
    end

    with_value(:outside) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:yAlign=\"outside\"/>"
    end

    with_value(:top) do
      it_should_assign_successfully
      it_should_output "<w:framePr w:yAlign=\"top\"/>"
    end

    with_value(:something_bad) do
      it_should_raise_an_exception
    end
  end

end
