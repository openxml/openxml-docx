module OpenXml
  module Docx
    module Elements
      class Font < Container
        namespace :w

        with_namespace :w do
          attribute :font_name, expects: :string, displays_as: :name
        end

      end
    end
  end
end
