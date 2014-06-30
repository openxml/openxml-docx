module Rocx
  module Properties
    class Columns < ContainerProperty
      tag :cols
      child_class :column

      attribute :equal_width, expects: :true_or_false
      attribute :number, expects: :integer, displays_as: :num
      attribute :separator, expects: :true_or_false, displays_as: :sep
      attribute :space, expects: :integer
    end
  end
end
