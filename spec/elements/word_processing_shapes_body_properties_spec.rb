require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingShapesBodyProperties do
  include ElementTestMacros

  it_should_use tag: :bodyPr, name: "word_processing_shapes_body_properties"

  for_attribute(:anchor)do
    %i(b ctr dist just t).each do |allowed|
      with_value(allowed) do
        it_should_assign_successfully
        it_should_output "<wps:bodyPr anchor=\"#{allowed}\"/>"
      end
    end

    with_value(:notRight) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:anchor_center, displays_as: :anchorCtr)do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<wps:bodyPr anchorCtr=\"true\"/>"
    end

    with_value(1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:bottom_inset, displays_as: :bIns)do
    with_value(1234) do
      it_should_assign_successfully
      it_should_output "<wps:bodyPr bIns=\"1234\"/>"
    end

    with_value(-1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:compatible_line_spacing, displays_as: :compatLnSpc)do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<wps:bodyPr compatLnSpc=\"true\"/>"
    end

    with_value(1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:force_anti_alias, displays_as: :forceAA)do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<wps:bodyPr forceAA=\"true\"/>"
    end

    with_value(1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:from_word_art, displays_as: :fromWordArt)do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<wps:bodyPr fromWordArt=\"true\"/>"
    end

    with_value(1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:horizontal_overflow, displays_as: :horzOverflow)do
    %i(clip overflow).each do |allowed|
      with_value(allowed) do
        it_should_assign_successfully
        it_should_output "<wps:bodyPr horzOverflow=\"#{allowed}\"/>"
      end
    end

    with_value(:notRight) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:left_inset, displays_as: :lIns)do
    with_value(1234) do
      it_should_assign_successfully
      it_should_output "<wps:bodyPr lIns=\"1234\"/>"
    end

    with_value(-1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:number_of_columns, displays_as: :numCol)do
    with_value(9) do
      it_should_assign_successfully
      it_should_output "<wps:bodyPr numCol=\"9\"/>"
    end

    with_value([0, 17, :not_a_number]) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:right_inset, displays_as: :rIns)do
    with_value(1234) do
      it_should_assign_successfully
      it_should_output "<wps:bodyPr rIns=\"1234\"/>"
    end

    with_value(-1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:rotation, displays_as: :rot)do
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

  for_attribute(:right_to_left_columns, displays_as: :rtlCol)do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<wps:bodyPr rtlCol=\"true\"/>"
    end

    with_value(1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:space_between_columns, displays_as: :spcCol)do
    with_value(1234) do
      it_should_assign_successfully
      it_should_output "<wps:bodyPr spcCol=\"1234\"/>"
    end

    with_value(-1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:paragraph_spacing, displays_as: :spcFirstLastPara)do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<wps:bodyPr spcFirstLastPara=\"true\"/>"
    end

    with_value(1234) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:top_inset, displays_as: :tIns)do
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

  for_attribute(:vertical, displays_as: :vert)do
    %i(eaVert horz mongolianVert vert vert270 wordArt Vert wordArtVertRtl).each do |allowed|
      with_value(allowed) do
        it_should_assign_successfully
        it_should_output "<wps:bodyPr vert=\"#{allowed}\"/>"
      end
    end

    with_value(:notRight) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:vertical_overflow, displays_as: :vertOverflow)do
    %i(clip ellipsis overflow).each do |allowed|
      with_value(allowed) do
        it_should_assign_successfully
        it_should_output "<wps:bodyPr vertOverflow=\"#{allowed}\"/>"
      end
    end

    with_value(:notRight) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:wrap)do
    %i(none square).each do |allowed|
      with_value(allowed) do
        it_should_assign_successfully
        it_should_output "<wps:bodyPr wrap=\"#{allowed}\"/>"
      end
    end

    with_value(:notRight) do
      it_should_raise_an_exception
    end
  end

end
