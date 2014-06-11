require "spec_helper"

describe Rocx::Properties::ConditionalFormatting do
  include PropertyTestMacros

  it_should_use tag: :cnfStyle, name: "conditional_formatting"

  for_attribute(:even_horizontal_band) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<w:cnfStyle w:evenHBand=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output ""
    end
  end

  for_attribute(:even_vertical_band) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<w:cnfStyle w:evenVBand=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output ""
    end
  end

  for_attribute(:first_column) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<w:cnfStyle w:firstColumn=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output ""
    end
  end

  for_attribute(:first_row) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<w:cnfStyle w:firstRow=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output ""
    end
  end

  for_attribute(:first_row_first_column) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<w:cnfStyle w:firstRowFirstColumn=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output ""
    end
  end

  for_attribute(:first_row_last_column) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<w:cnfStyle w:firstRowLastColumn=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output ""
    end
  end

  for_attribute(:last_column) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<w:cnfStyle w:lastColumn=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output ""
    end
  end

  for_attribute(:last_row) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<w:cnfStyle w:lastRow=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output ""
    end
  end

  for_attribute(:last_row_first_column) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<w:cnfStyle w:lastRowFirstColumn=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output ""
    end
  end

  for_attribute(:last_row_last_column) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<w:cnfStyle w:lastRowLastColumn=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output ""
    end
  end

  for_attribute(:odd_horizontal_band) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<w:cnfStyle w:oddHBand=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output ""
    end
  end

  for_attribute(:odd_vertical_band) do
    with_value(true) do
      it_should_assign_successfully
      it_should_output "<w:cnfStyle w:oddVBand=\"true\"/>"
    end

    with_value(false) do
      it_should_assign_successfully
      it_should_output ""
    end
  end

  with_no_attributes_set do
    it_should_output "", assign: false
  end

  with_these_attributes_set(last_row: true, last_column: true, last_row_last_column: true) do
    it_should_output "<w:cnfStyle w:lastColumn=\"true\" w:lastRow=\"true\" w:lastRowLastColumn=\"true\"/>", assign: false
  end

end
