require "spec_helper"

describe OpenXml::DrawingML::Elements::PictureLocks do
  include ElementTestMacros

  it_should_use tag: :picLocks, name: "picture_locks"

  for_attribute(:hide_adjust_handles) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<a:picLocks noAdjustHandles=\"true\"/>"
    end

    with_value(:not_a_boolean) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:disallow_arrowhead_changes) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<a:picLocks noChangeArrowheads=\"true\"/>"
    end

    with_value(:not_a_boolean) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:disallow_aspect_ratio_changes) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<a:picLocks noChangeAspect=\"true\"/>"
    end

    with_value(:not_a_boolean) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:disallow_shape_type_changes) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<a:picLocks noChangeShapeType=\"true\"/>"
    end

    with_value(:not_a_boolean) do
      it_should_raise_an_exception
    end
  end
  for_attribute(:disallow_cropping) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<a:picLocks noCrop=\"true\"/>"
    end

    with_value(:not_a_boolean) do
      it_should_raise_an_exception
    end
  end
  for_attribute(:disallow_editing_points) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<a:picLocks noEditPoints=\"true\"/>"
    end

    with_value(:not_a_boolean) do
      it_should_raise_an_exception
    end
  end
  for_attribute(:disallow_grouping) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<a:picLocks noGrp=\"true\"/>"
    end

    with_value(:not_a_boolean) do
      it_should_raise_an_exception
    end
  end
  for_attribute(:disallow_moving) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<a:picLocks noMove=\"true\"/>"
    end

    with_value(:not_a_boolean) do
      it_should_raise_an_exception
    end
  end
  for_attribute(:disallow_resizing) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<a:picLocks noResize=\"true\"/>"
    end

    with_value(:not_a_boolean) do
      it_should_raise_an_exception
    end
  end
  for_attribute(:disallow_rotation) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<a:picLocks noRot=\"true\"/>"
    end

    with_value(:not_a_boolean) do
      it_should_raise_an_exception
    end
  end
  for_attribute(:disallow_selection) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<a:picLocks noSelect=\"true\"/>"
    end

    with_value(:not_a_boolean) do
      it_should_raise_an_exception
    end
  end

end
