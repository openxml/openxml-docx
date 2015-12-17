module OpenXml
  module DrawingML
    module Elements
      class PictureShapeProperties < OpenXml::Docx::Elements::Container
        namespace :pic
        tag :spPr

        attribute :black_and_white_mode, one_of: %i(auto black blackGray blackWhite clr gray grayWhite hidden invGray ltGray white), displays_as: :bwMode

      end
    end
  end
end
