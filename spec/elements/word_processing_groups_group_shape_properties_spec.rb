require "spec_helper"

describe OpenXml::Docx::Elements::WordProcessingGroupsGroupShapeProperties do
  include ElementTestMacros

  it_should_use tag: :grpSpPr, name: "word_processing_groups_group_shape_properties"

  for_attribute(:bw_mode) do
    %i(auto black blackGray blackWhite clr gray grayWhite hidden invGray ltGray white).each do |good_value|
      with_value(good_value) do
        it_should_assign_successfully
        it_should_output "<wpg:grpSpPr bwMode=\"#{good_value}\"/>"
      end
    end

    with_value(:no_good) do
      it_should_raise_an_exception
    end
  end

end
