module OpenXml
  module DrawingML
    module Elements
      class PictureLocks < OpenXml::Docx::Elements::Element
        namespace :a
        tag :picLocks

        attribute :hide_adjust_handles, expects: :boolean, displays_as: :noAdjustHandles
        attribute :disallow_arrowhead_changes, expects: :boolean, displays_as: :noChangeArrowheads
        attribute :disallow_aspect_ratio_changes, expects: :boolean, displays_as: :noChangeAspect
        attribute :disallow_shape_type_changes, expects: :boolean, displays_as: :noChangeShapeType
        attribute :disallow_cropping, expects: :boolean, displays_as: :noCrop
        attribute :disallow_editing_points, expects: :boolean, displays_as: :noEditPoints
        attribute :disallow_grouping, expects: :boolean, displays_as: :noGrp
        attribute :disallow_moving, expects: :boolean, displays_as: :noMove
        attribute :disallow_resizing, expects: :boolean, displays_as: :noResize
        attribute :disallow_rotation, expects: :boolean, displays_as: :noRot
        attribute :disallow_selection, expects: :boolean, displays_as: :noSelect

      end
    end
  end
end
