module OpenXml
  module Docx
    module Elements
      class TitlePage < Element
        tag :titlePg

        attribute :value, expects: :boolean, displays_as: :val, namespace: :w

      end
    end
  end
end
