module OpenXml
  module DrawingML
    module Elements
      class GraphicFrameLocks < OpenXml::Docx::Elements::Element
        namespace :a

        attribute :noChangeAspect, expects: :true_or_false
        attribute :noDrilldown, expects: :true_or_false
        attribute :noGrouping, expects: :true_or_false, displays_as: :noGrp
        attribute :noMove, expects: :true_or_false
        attribute :noResize, expects: :true_or_false
        attribute :noSelect, expects: :true_or_false

      end
    end
  end
end
