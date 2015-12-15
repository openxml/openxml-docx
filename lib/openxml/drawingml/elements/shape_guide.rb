module OpenXml
  module DrawingML
    module Elements
      class ShapeGuide < OpenXml::Docx::Elements::Element
        namespace :a
        tag :gd

        attribute :formula, expects: :valid_formula, displays_as: :fmla
        attribute :guide_name, expects: :string, displays_as: :name

      private

        def valid_formula(value)
          raise ArgumentError unless ok_formulae.any? { |f| value =~ f }
        end

        def ok_formulae # Office Open XML spec section 20.1.9.11
          [ /^\*\/\s[0-9a-z\-]+\s[0-9a-z\-]+\s[0-9a-z\-]+$/i, # Multiply Divide formula "*/ x y z" = ((x * y) / z)
            /^\+\-\s[0-9a-z\-]+\s[0-9a-z\-]+\s[0-9a-z\-]+$/i, # Add Subtract formula "+- x y z" = ((x + y) - z)
            /^\+\/\s[0-9a-z\-]+\s[0-9a-z\-]+\s[0-9a-z\-]+$/i, # Add Divide formula "+/ x y z" = ((x + y) / z)
            /^\?\:\s[0-9a-z\-]+\s[0-9a-z\-]+\s[0-9a-z\-]+$/i, # If Else formula "?: x y z" = (x > 0) ? y : z
            /^abs\s[0-9a-z\-]+$/i, # Absolute Value formula "abs x" = (x < 0) -1 * x : x
            /^at2\s[0-9a-z\-]+\s[0-9a-z\-]+$/i, # ArcTan formula "at2 x y" = arctan(y / x)
            /^cat2\s[0-9a-z\-]+\s[0-9a-z\-]+\s[0-9a-z\-]+$/i, # Cosine ArcTan formula "cat2 x y z" = (x * cos(arctan(z / y)))
            /^cos\s[0-9a-z\-]+\s[0-9a-z\-]+$/i, # Cosine formula "cos x y" = x * cos(y)
            /^max\s[0-9a-z\-]+\s[0-9a-z\-]+$/i, # Maximum Value formula "max x y" = (x > y) ? x : y
            /^min\s[0-9a-z\-]+\s[0-9a-z\-]+$/i, # Minimum Value formula "min x y" = (x < y) ? x : y
            /^mod\s[0-9a-z\-]+\s[0-9a-z\-]+\s[0-9a-z\-]+$/i, # Modulo formula "mod x y z" = sqrt(x^2 + y^2 + z^2)
            /^pin\s[0-9a-z\-]+\s[0-9a-z\-]+\s[0-9a-z\-]+$/i, # Pin To formula "pin x y z" = if(y < x) x elsif(y > z) z else y
            /^sat2\s[0-9a-z\-]+\s[0-9a-z\-]+\s[0-9a-z\-]+$/i, # Sine ArcTan formula "sat2 x y z" = (x * sin(arctan(z / y)))
            /^sin\s[0-9a-z\-]+\s[0-9a-z\-]+$/i, # Sine formula "sin x y" = x * sin(y)
            /^sqrt\s[0-9a-z\-]+$/i, # Square Root formula "sqrt x" = sqrt(x)
            /^tan\s[0-9a-z\-]+\s[0-9a-z\-]+$/i, # Tangent formula "tan x y" = x * tan(y)
            /^val\s[0-9a-z\-]+$/i ]  # Literal Value formula "val x" = x
        end

      end
    end
  end
end
