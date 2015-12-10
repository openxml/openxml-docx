module OpenXml
  module Docx
    module Elements
      class Break < Element
        tag :br

        with_namespace :w do
          attribute :clear, one_of: %i(all left none right)
          attribute :type, one_of: %i(column page textWrapping)
        end

      end
    end
  end
end
