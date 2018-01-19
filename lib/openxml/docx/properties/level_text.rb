module OpenXml
  module Docx
    module Properties
      class LevelText < StringProperty
        include HasAttributes
        tag :lvlText

        with_namespace :w do
          attribute :null, expects: :boolean
        end
      end
    end
  end
end
