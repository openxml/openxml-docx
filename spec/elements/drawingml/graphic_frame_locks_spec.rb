require "spec_helper"

describe OpenXml::DrawingML::Elements::GraphicFrameLocks do
  include ElementTestMacros

  it_should_use tag: :graphicFrameLocks, name: "graphic_frame_locks"

  for_attribute(:noChangeAspect) do
    with_values([true, false]) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:neither) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:noDrilldown) do
    with_values([true, false]) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:neither) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:noGrouping, displays_as: :noGrp) do
    with_values([true, false]) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:neither) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:noMove) do
    with_values([true, false]) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:neither) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:noResize) do
    with_values([true, false]) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:neither) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:noSelect) do
    with_values([true, false]) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:neither) do
      it_should_raise_an_exception
    end
  end

  with_no_attributes_set do
    it_should_output "<a:graphicFrameLocks/>", assign: false
  end

end
