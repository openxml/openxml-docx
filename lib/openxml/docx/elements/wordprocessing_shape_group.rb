module OpenXml
  module Docx
    module Elements
      class WordprocessingShapeGroup < OpenXml::Docx::Element
        include HasChildren

        tag :wgp
        namespace :wpg

      end
    end
  end
end
