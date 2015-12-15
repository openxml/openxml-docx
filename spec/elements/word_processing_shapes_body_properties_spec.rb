require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingShapesBodyProperties do
  include ElementTestMacros

  it_should_use tag: :bodyPr, name: "word_processing_shapes_body_properties"

  for_attribute(:anchor)do
    allowed = %i(b ctr dist just t)
    with_values(allowed) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:notRight) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:anchorCtr)do
    with_value(true) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:bottom_inset, displays_as: :bIns)do
    with_value(1234) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(-1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:compatible_line_spacing, displays_as: :compatLnSpc)do
    with_value(true) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:force_anti_alias, displays_as: :forceAA)do
    with_value(true) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:fromWordArt)do
    with_value(true) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:horzOverflow)do
    allowed = %i(clip overflow)
    with_values(allowed) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:notRight) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:left_inset, displays_as: :lIns)do
    with_value(1234) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(-1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:numCol)do
    allowed = (1..16).to_a
    with_values(allowed) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:notRight) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:right_inset, displays_as: :rIns)do
    with_value(1234) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(-1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:rotation, displays_as: :rot)do
    with_values([1234, -1234]) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value("not valid") do
      it_should_raise_an_exception
    end
  end

  for_attribute(:right_to_left_columns, displays_as: :rtlCol)do
    with_value(true) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:space_between_columns, displays_as: :spcCol)do
    with_value(1234) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(-1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:paragraph_spacing, displays_as: :spcFirstLastPara)do
    with_value(true) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:top_inset, displays_as: :tIns)do
    with_value(1234) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(-1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:upright)do
    with_value(true) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:vert)do
    allowed = %i(eaVert horz mongolianVert vert vert270 wordArt Vert wordArtVertRtl)
    with_values(allowed) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:notRight) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:vertOverflow)do
    allowed = %i(clip ellipsis overflow)
    with_values(allowed) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:notRight) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:wrap)do
    allowed = %i(none square)
    with_values(allowed) do
      it_should_assign_successfully
      it_should_output_regular_xml
    end

    with_value(:notRight) do
      it_should_raise_an_exception
    end
  end

end
