require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingShapesBodyProperties do
  include ElementTestMacros

  it_should_use tag: :bodyPr, name: "word_processing_shapes_body_properties"

  for_attribute(:anchor)do
    %i(b ctr dist just t).each do |value|
      with_value(value) do
        it_should_assign_successfully
        it_should_output "<wps:bodyPr anchor=\"#{value}\"/>"
      end
    end

    with_value(:notRight) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:anchorCtr)do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<wps:bodyPr anchorCtr=\"true\"/>"
    end

    with_value(1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:bottom_inset)do
    with_value(1234) do
      it_should_assign_successfully
      it_should_output "<wps:bodyPr bIns=\"1234\"/>"
    end

    with_value(-1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:compatible_line_spacing)do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<wps:bodyPr compatLnSpc=\"true\"/>"
    end

    with_value(1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:force_anti_alias)do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<wps:bodyPr forceAA=\"true\"/>"
    end

    with_value(1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:fromWordArt)do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<wps:bodyPr fromWordArt=\"true\"/>"
    end

    with_value(1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:horzOverflow)do
    %i(clip overflow).each do |value|
      with_value(value) do
        it_should_assign_successfully
        it_should_output "<wps:bodyPr horzOverflow=\"#{value}\"/>"
      end
    end

    with_value(:notRight) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:left_inset)do
    with_value(1234) do
      it_should_assign_successfully
      it_should_output "<wps:bodyPr lIns=\"1234\"/>"
    end

    with_value(-1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:numCol)do
    (1..16).to_a.each do |value|
      with_value(value) do
        it_should_assign_successfully
        it_should_output "<wps:bodyPr numCol=\"#{value}\"/>"
      end
    end

    with_value(:notRight) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:right_inset)do
    with_value(1234) do
      it_should_assign_successfully
      it_should_output "<wps:bodyPr rIns=\"1234\"/>"
    end

    with_value(-1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:rotation)do
    with_value(1234) do
      it_should_assign_successfully
      it_should_output "<wps:bodyPr rot=\"1234\"/>"
    end

    with_value(-1234) do
      it_should_assign_successfully
      it_should_output "<wps:bodyPr rot=\"-1234\"/>"
    end

    with_value("not valid") do
      it_should_raise_an_exception
    end
  end

  for_attribute(:right_to_left_columns)do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<wps:bodyPr rtlCol=\"true\"/>"
    end

    with_value(1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:space_between_columns)do
    with_value(1234) do
      it_should_assign_successfully
      it_should_output "<wps:bodyPr spcCol=\"1234\"/>"
    end

    with_value(-1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:paragraph_spacing)do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<wps:bodyPr spcFirstLastPara=\"true\"/>"
    end

    with_value(1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:top_inset)do
    with_value(1234) do
      it_should_assign_successfully
      it_should_output "<wps:bodyPr tIns=\"1234\"/>"
    end

    with_value(-1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:upright)do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<wps:bodyPr upright=\"true\"/>"
    end

    with_value(1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:vert)do
    ok_values = %i(eaVert horz mongolianVert vert vert270 wordArt Vert wordArtVertRtl)
    ok_values.each do |value|
      with_value(value) do
        it_should_assign_successfully
        it_should_output "<wps:bodyPr vert=\"#{value}\"/>"
      end
    end

    with_value(:notRight) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:vertOverflow)do
    %i(clip ellipsis overflow).each do |value|
      with_value(value) do
        it_should_assign_successfully
        it_should_output "<wps:bodyPr vertOverflow=\"#{value}\"/>"
      end
    end

    with_value(:notRight) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:wrap)do
     %i(none square).each do |value|
      with_value(value) do
        it_should_assign_successfully
        it_should_output "<wps:bodyPr wrap=\"#{value}\"/>"
      end
    end

    with_value(:notRight) do
      it_should_raise_an_exception
    end
  end

end
