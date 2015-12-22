module OpenXml
  module DrawingML
    module Elements
      class GraphicFrameLocks < OpenXml::Docx::Elements::Element
        namespace :a

        attribute :disallow_aspect_ratio_changes, expects: :boolean, displays_as: :noChangeAspect
        attribute :disallow_drilldown, expects: :boolean, displays_as: :noDrilldown
        attribute :disallow_grouping, expects: :boolean, displays_as: :noGrp
        attribute :disallow_moving, expects: :boolean, displays_as: :noMove
        attribute :disallow_resizing, expects: :boolean, displays_as: :noResize
        attribute :disallow_selection, expects: :boolean, displays_as: :noSelect

      end
    end
  end
end
