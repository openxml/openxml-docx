require "spec_helper"

describe OpenXml::DrawingML::Elements::GraphicFrameLocks do
  include ElementTestMacros

  it_should_use tag: :graphicFrameLocks, name: "graphic_frame_locks"

  attributes = %i(noChangeAspect noDrilldown noGrouping noMove noResize noSelect)
  display_map = { noGrouping: :noGrp }

  attributes.each do |attribute|
    for_attribute(attribute) do
      with_value(true) do
        it_should_assign_successfully
        display = display_map[attribute] || attribute
        it_should_output "<a:graphicFrameLocks #{display}=\"true\"/>"
      end

      with_value(false) do
        it_should_assign_successfully
        it_should_output "<a:graphicFrameLocks/>"
      end

      with_value(:neither) do
        it_should_raise_an_exception
      end
    end
  end

  with_no_attributes_set do
    it_should_output "<a:graphicFrameLocks/>", assign: false
  end

end
