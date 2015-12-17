require "spec_helper"

describe OpenXml::DrawingML::Elements::GraphicFrameLocks do
  include ElementTestMacros

  it_should_use tag: :graphicFrameLocks, name: "graphic_frame_locks"

  for_attribute(:disallow_aspect_ratio_changes) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<a:graphicFrameLocks noChangeAspect=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output "<a:graphicFrameLocks noChangeAspect=\"false\"/>"
    end

    with_value(:neither) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:disallow_drilldown) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<a:graphicFrameLocks noDrilldown=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output "<a:graphicFrameLocks noDrilldown=\"false\"/>"
    end

    with_value(:neither) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:disallow_grouping) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<a:graphicFrameLocks noGrp=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output "<a:graphicFrameLocks noGrp=\"false\"/>"
    end

    with_value(:neither) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:disallow_moving) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<a:graphicFrameLocks noMove=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output "<a:graphicFrameLocks noMove=\"false\"/>"
    end
    with_value(:neither) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:disallow_resizing) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<a:graphicFrameLocks noResize=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output "<a:graphicFrameLocks noResize=\"false\"/>"
    end

    with_value(:neither) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:disallow_selection) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<a:graphicFrameLocks noSelect=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output "<a:graphicFrameLocks noSelect=\"false\"/>"
    end

    with_value(:neither) do
      it_should_raise_an_exception
    end
  end

  with_no_attributes_set do
    it_should_output "<a:graphicFrameLocks/>", assign: false
  end

end
