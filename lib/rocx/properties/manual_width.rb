module Rocx
  module Properties
    class ManualWidth < ComplexProperty
      include AttributeBuilder

      attribute :id, expects: :integer
      attribute :width, expects: :positive_integer, displays_as: :val

      tag :fitText
    end
  end
end
