module OpenXml
  module Docx
    module Elements
      class WordProcessingGroupsGroupShapeProperties < Container
        tag :grpSpPr
        namespace :wpg

        attribute :bw_mode, one_of: %i(auto black blackGray blackWhite clr gray grayWhite hidden invGray ltGray white), displays_as: :bwMode

      end
    end
  end
end
