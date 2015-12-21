module OpenXml
  module DrawingML
    module Elements
      class GraphicFrameLocks < OpenXml::Docx::Elements::Element
        namespace :a

        attribute :disallow_aspect_ratio_changes, expects: :true_or_false, displays_as: :noChangeAspect
        attribute :disallow_drilldown, expects: :true_or_false, displays_as: :noDrilldown
        attribute :disallow_grouping, expects: :true_or_false, displays_as: :noGrp
        attribute :disallow_moving, expects: :true_or_false, displays_as: :noMove
        attribute :disallow_resizing, expects: :true_or_false, displays_as: :noResize
        attribute :disallow_selection, expects: :true_or_false, displays_as: :noSelect

      end
    end
  end
end
