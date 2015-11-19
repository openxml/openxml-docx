require "rocx/properties/latent_styles_exception"

module Rocx
  module Properties
    class LatentStyles < ContainerProperty
      child_class :latent_styles_exception

      attribute :count, expects: :positive_integer
      attribute :default_locked_state, expects: :true_or_false, displays_as: :defLockedState
      attribute :default_qformat, expects: :true_or_false, displays_as: :defQFormat
      attribute :default_semi_hidden, expects: :true_or_false, displays_as: :defSemiHidden
      attribute :default_ui_priority, expects: :integer, displays_as: :defUIPriority
      attribute :default_unhide_when_used, expects: :true_or_false, displays_as: :defUnhideWhenUsed

      def render?
        true # Output XML even if there are no children
      end

    end
  end
end
