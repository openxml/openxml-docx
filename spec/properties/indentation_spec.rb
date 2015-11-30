require "spec_helper"

describe OpenXml::Docx::Properties::Indentation do
  include PropertyTestMacros

  it_should_use tag: :ind, name: "indentation"

  for_attribute(:end) do
    with_value(1220) do
      it_should_assign_successfully
      it_should_output "<w:ind w:end=\"1220\"/>"
    end

    with_value(-1220) do
      it_should_assign_successfully
      it_should_output "<w:ind w:end=\"-1220\"/>"
    end

    with_value(1220.3) do
      it_should_raise_an_exception
    end

    with_value(:bad) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:end_characters) do
    with_value(1220) do
      it_should_assign_successfully
      it_should_output "<w:ind w:endChars=\"1220\"/>"
    end

    with_value(-1220) do
      it_should_assign_successfully
      it_should_output "<w:ind w:endChars=\"-1220\"/>"
    end

    with_value(1220.3) do
      it_should_raise_an_exception
    end

    with_value(:bad) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:first_line) do
    with_value(1220) do
      it_should_assign_successfully
      it_should_output "<w:ind w:firstLine=\"1220\"/>"
    end

    with_value(-1220) do
      it_should_assign_successfully
      it_should_output "<w:ind w:firstLine=\"-1220\"/>"
    end

    with_value(1220.3) do
      it_should_raise_an_exception
    end

    with_value(:bad) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:first_line_characters) do
    with_value(1220) do
      it_should_assign_successfully
      it_should_output "<w:ind w:firstLineChars=\"1220\"/>"
    end

    with_value(-1220) do
      it_should_assign_successfully
      it_should_output "<w:ind w:firstLineChars=\"-1220\"/>"
    end

    with_value(1220.3) do
      it_should_raise_an_exception
    end

    with_value(:bad) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:hanging) do
    with_value(1220) do
      it_should_assign_successfully
      it_should_output "<w:ind w:hanging=\"1220\"/>"
    end

    with_value(-1220) do
      it_should_assign_successfully
      it_should_output "<w:ind w:hanging=\"-1220\"/>"
    end

    with_value(1220.3) do
      it_should_raise_an_exception
    end

    with_value(:bad) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:hanging_characters) do
    with_value(1220) do
      it_should_assign_successfully
      it_should_output "<w:ind w:hangingChars=\"1220\"/>"
    end

    with_value(-1220) do
      it_should_assign_successfully
      it_should_output "<w:ind w:hangingChars=\"-1220\"/>"
    end

    with_value(1220.3) do
      it_should_raise_an_exception
    end

    with_value(:bad) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:start) do
    with_value(1220) do
      it_should_assign_successfully
      it_should_output "<w:ind w:start=\"1220\"/>"
    end

    with_value(-1220) do
      it_should_assign_successfully
      it_should_output "<w:ind w:start=\"-1220\"/>"
    end

    with_value(1220.3) do
      it_should_raise_an_exception
    end

    with_value(:bad) do
      it_should_raise_an_exception
    end
  end

  for_attribute(:start_characters) do
    with_value(1220) do
      it_should_assign_successfully
      it_should_output "<w:ind w:startChars=\"1220\"/>"
    end

    with_value(-1220) do
      it_should_assign_successfully
      it_should_output "<w:ind w:startChars=\"-1220\"/>"
    end

    with_value(1220.3) do
      it_should_raise_an_exception
    end

    with_value(:bad) do
      it_should_raise_an_exception
    end
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(start_characters: 44, hanging: 1200) do
    it_should_output "<w:ind w:hanging=\"1200\" w:startChars=\"44\"/>", assign: false
  end

end
